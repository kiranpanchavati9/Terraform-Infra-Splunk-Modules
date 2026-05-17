

# Create the firewall rules

resource "aws_security_group" "allow_splunk_ports" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_splunk_ports"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_splunk_ports.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-allow-all-traffic-egress"
  }# se
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_splunk_ports.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-allow-all-traffic-ingress"
  }# sema# semantically equivalent to all ports
}


# Create the AWS Instance

resource "aws_instance" "splunk-hf" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_ids]
  iam_instance_profile = var.iam_role
  # availability_zone = var.zone_id
  key_name = var.key_name
  tags = {
    Name = var.component
  }
}


# Install the Splunk

resource "null_resource" "splunk-hf" {

  connection {
    type        =  var.type
    user        = var.user
    private_key = var.private_key
    host        =  aws_instance.splunk-hf.public_ip
    timeout     = var.timeout
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y wget",
      "sudo dnf install -y git",
      "rm -rf /home/ec2-user/Splunk-December-Weekday-Batch",
      "git clone https://${var.github_username}:${var.github_token}@github.com/kiranpanchavati9/Splunk-December-Weekday-Batch.git /home/ec2-user/Splunk-December-Weekday-Batch",
      "sudo bash '/home/ec2-user/Splunk-December-Weekday-Batch/Splunk Installation/splunk.sh'",
    ]
  }
}


