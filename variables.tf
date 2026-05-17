variable "ami" {
  default = "ami-076d128fb049922d4"
}

variable "instance_type" {
  default = "t3.small"
}

variable "iam_role" {
  default = "workstation-role"
}

# variable "zone_id" {
#   default = "Z01214421PKKTLXAI5VN5"
# }

variable "component" {
  default = "splunk-hf"
}

variable "key_name" {
  default = "roboshop-dev"
}

variable "type" {
  default = "ssh"
}

variable "user" {
  default = "ec2-user"
}

variable "private_key" {
  default = "/root/.ssh/roboshop-dev.pem"
}

variable "timeout" {
  default = "5s"
}
