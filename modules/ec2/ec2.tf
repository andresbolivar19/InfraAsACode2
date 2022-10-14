provider "aws" {
  region  = var.aws_region
}

resource "aws_instance" "ec2" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name = var.key_name

  tags = {
    Name = var.name_ec2
  }

  user_data = "${file("ec2-init-script.sh")}"
}
