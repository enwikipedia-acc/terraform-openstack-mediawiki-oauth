locals {
  resource_prefix = "${var.project_prefix}-oauth-${var.environment}"
}

variable "image_name" {
  description = "Name of the OpenStack image to deploy. Changes to this value will *not* trigger a rebuild of the instance."
  type        = string
}

variable "project_prefix" {
  description = "Prefix to be added to all resource names"
  type        = string
}

variable "environment" {
  description = "Blue (`b`) or Green (`g`) environment"
  type        = string
}

variable "instance_type" {
  description = "The OpenStack instance flavour ID"
  type        = string
}

variable "public_hostname" {
  description = "The FQDN of the service to be deployed"
  type        = string
}

variable "proxy_domain" {
  description = "The WMCS domain to deploy the proxy into"
  type        = string
}

variable "network" {
  description = "The OpenStack network to connect the instance to"
  type        = string
}

variable "security_groups" {
  description = "A list of security group names to apply to the instance"
  type        = list(string)
  default     = []
}

variable "database_snapshot_name" {
  description = "The name of a volume snapshot to base the database volume on"
  type        = string
  default     = null
}

variable "dns_zone_id" {
  description = "The DNS zone ID to register the instance name in"
  default = null
}