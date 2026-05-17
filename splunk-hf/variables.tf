variable "cidr_ipv4" {
  default = "0.0.0.0/0"
}

variable "ip_protocol" {
  default = "-1"
}

variable "ami" {}
variable "instance_type" {}
variable "iam_role" {}
# variable "zone_id" {}
variable "component" {}
variable "vpc_security_group_ids" {}
variable "key_name" {}
variable "type" {}
variable "user" {}
variable "private_key" {}
variable "timeout" {}