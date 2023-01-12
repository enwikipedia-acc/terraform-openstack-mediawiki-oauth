terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48"
    }

    cloudvps = {
      source  = "terraform.wmcloud.org/registry/cloudvps"
      version = "~> 0.1"
    }
  }

  required_version = ">= 1.3"
}


data "openstack_blockstorage_snapshot_v3" "db-snapshot" {
  count = var.database_snapshot_name == null ? 0 : 1
  name  = var.database_snapshot_name
}

resource "openstack_blockstorage_volume_v3" "oauth-db" {
  name        = "${var.resource_prefix}-database"
  description = "OAuth MediaWiki database; managed by Terraform"
  size        = 2

  snapshot_id = var.database_snapshot_name == null ? null : data.openstack_blockstorage_snapshot_v3.db-snapshot[0].id
}

resource "openstack_compute_instance_v2" "oauthapp" {
  name            = var.resource_prefix
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = var.instance_type
  user_data       = file("${path.module}/userdata.sh")
  security_groups = var.security_groups

  metadata = {
    publicdns   = var.public_hostname
    terraform   = "Yes"
    environment = var.environment
  }

  network {
    uuid = var.network
  }

  lifecycle {
    ignore_changes = [
      image_id
    ]
  }
}

resource "openstack_compute_volume_attach_v2" "oauth-db" {
  instance_id = openstack_compute_instance_v2.oauthapp.id
  volume_id   = openstack_blockstorage_volume_v3.oauth-db.id
  device      = "/dev/sdb"
}

resource "openstack_dns_recordset_v2" "oauthapp" {
  name    = var.dns_name
  zone_id = var.dns_zone_id
  ttl     = 180
  type    = "A"
  records = [openstack_compute_instance_v2.oauthapp.access_ip_v4]
}
