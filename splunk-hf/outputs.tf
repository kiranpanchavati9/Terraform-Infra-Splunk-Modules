output "security_group_id" {
  description = "ID of the Security group"
  value = aws_security_group.allow_splunk_ports.id
}