module "ec2" {
  source            = "../../modules/ec2"
  region            = var.aws_region
  ami               = var.ami
  instance_type     = var.instance_type
}
