provider "aws" {
  region  = var.aws_region
}

resource "aws_security_group" "security_group_ec2" {
  name        = var.security_group
  description = "Security Group EC2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from Jenkins server
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = var.security_group
  }

  lifecycle {
  create_before_destroy = true
  }
}

resource "aws_instance" "ec2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  vpc_security_group_ids  = [aws_security_group.security_group_ec2.id]
  #private_ip              = "172.31.46.179"

  tags = {
    Name = var.name_ec2
  }

  user_data = "${file("ec2-init-script.sh")}"
}
