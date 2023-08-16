variable "image_name" {
  description = "Name of the OpenStack image to deploy. Changes to this value will *not* trigger a rebuild of the instance."
  type        = string
}

variable "resource_prefix" {
  description = "Prefix to be added to all resource names"
  type        = string
}

variable "dns_name" {
  description = "Instance DNS FQDN"
  type        = string
}

variable "environment" {
  description = "'blue' or 'green' environment"
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
  default     = ["default"]
}

variable "dns_zone_id" {
  description = "The DNS zone ID to register the instance name in"
  type        = string
}

variable "prevent_destroy" {
  description = "Prevent destruction of the volume attachment. Make sure the disk is unmounted first, before trying to detach."
  type        = bool
  default     = true
}
