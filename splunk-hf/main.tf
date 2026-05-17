

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
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile = var.iam_role
  availability_zone = var.zone_id
  tags = {
    Name = var.component
  }
}



