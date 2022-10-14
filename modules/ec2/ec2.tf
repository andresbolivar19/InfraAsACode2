locals {
  tags = {
    Project     = var.project
    CreatedOn   = timestamp()
    Environment = terraform.workspace
    Name        = "terraform-vm"
  }
}

module "ec2_instance" {
  ami               = var.ami
  #availability_zone = var.availability_zone
  tags              = local.tags
  instance_type     = var.instance_type
}
