output "instance_ipv4" {
  value = openstack_compute_instance_v2.oauthapp.access_ip_v4
}

output "dns_name" {
  value = local.dns_name
}
