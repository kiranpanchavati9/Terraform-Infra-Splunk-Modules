output "splunk_hf_security_group_id" {
  description = "Security group ID from splunk-hf module"
  value       = module.splunk-hf.security_group_id
}