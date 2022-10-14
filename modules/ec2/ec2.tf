provider "aws" {
  #region = "us-east-2"
  region  = var.aws_region
}

resource "aws_instance" "ec2" {
  ami               = var.ami
  #availability_zone = var.availability_zone
  tags              = local.tags
  instance_type     = var.instance_type
}
