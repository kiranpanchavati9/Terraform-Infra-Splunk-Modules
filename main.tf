module "splunk-hf" {
  source = "./splunk-hf"
  vpc_security_group_ids  =  module.splunk-hf.security_group_id
  iam_role = var.iam_role
  #zone_id = var.zone_id
  instance_type = var.instance_type
  ami = var.ami
  component = var.component
  key_name = var.key_name
  type = var.type
  private_key = file(var.private_key)
  user = var.user
  timeout = var.timeout
  github_token =  var.github_token
  github_username =  var.github_username
}