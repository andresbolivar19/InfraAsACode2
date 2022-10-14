provider "aws" {
  region  = var.aws_region
}

resource "aws_instance" "ec2" {
  name              = var.name_ec2
  ami               = var.ami
  instance_type     = var.instance_type
}

