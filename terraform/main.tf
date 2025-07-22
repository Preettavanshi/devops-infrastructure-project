terraform {
  required_version = ">= 1.6.0"
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "my-terraform-locks"
    encrypt        = true
  }
}
provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source  = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "ec2" {
  source         = "./modules/compute"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.public_subnet_ids
  instance_count = 2
}

module "database" {
  source            = "./modules/database"
  db_subnet_group_name = module.vpc.db_subnet_group
  vpc_security_group_ids = [module.vpc.db_sg]
}

output "alb_dns" {
  value = module.ec2.alb_dns
}
