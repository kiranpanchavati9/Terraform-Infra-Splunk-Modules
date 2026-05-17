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
  type    = string
  default = "splunk"
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
  default = "/home/ec2-user/.ssh/roboshop-dev.pem"
}

variable "timeout" {
  default = "3m"
}

variable "github_username" {
  description = "GitHub username for cloning private repo"
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}
