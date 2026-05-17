# Create the AWS Instance

resource "aws_instance" "splunk-us" {
  ami           = var.ami
  instance_type = var.instance_type
  iam_instance_profile = var.iam_role
  # availability_zone = var.zone_id
  key_name = var.key_name
  tags = {
    Name = var.component
  }
}

# Install the Splunk

resource "null_resource" "splunk-us" {

  connection {
    type        =  var.type
    user        = var.user
    private_key = var.private_key
    host        =  aws_instance.splunk-us.public_ip
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


