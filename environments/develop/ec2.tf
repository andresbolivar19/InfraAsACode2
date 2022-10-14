module "ec2" {
  source              = "git@github.com:andresbolivar19/modules/ec2.git"
  environment         = var.environment
}