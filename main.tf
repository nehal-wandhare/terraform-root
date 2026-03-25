provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "git::https://github.com/nehal-wandhare/terraform-vpc-module.git"

  cidr_block = var.vpc_cidr
}

module "s3" {
  source = "git::https://github.com/nehal-wandhare/terraform-s3-module.git"

  bucket_name = var.bucket_name
}

module "rds" {
  source = "git::https://github.com/nehal-wandhare/terraform-rds-module.git"

  instance_class = var.db_class
  username       = var.db_user
  password       = var.db_pass
}

module "ec2" {
  source = "git::https://github.com/nehal-wandhare/terraform-ec2-module.git"

  ami           = var.ami
  instance_type = var.instance_type

  
  subnet_id     = module.vpc.subnet_id
}