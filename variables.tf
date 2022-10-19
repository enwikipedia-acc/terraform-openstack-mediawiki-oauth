locals {
  resource_prefix = "${var.project_prefix}-oauth-${var.environment}"
}

variable "image_id" {
  type = string
}

variable "project_prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_hostname" {
  type = string
}

variable "proxy_domain" {
  type = string
}

variable "network" {
  type = string
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "app_snapshot_name" {
  type    = string
  default = null
}

variable "database_snapshot_name" {
  type    = string
  default = null
}
