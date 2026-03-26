provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "git::https://github.com/nehal-wandhare/terraform-vpc-module.git?ref=main"

  cidr_block  = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  vpc_name    = var.vpc_name
}

module "sg" {
  source = "git::https://github.com/nehal-wandhare/terraform-sg-module.git?ref=main"

  vpc_id            = module.vpc.vpc_id
  sg_name           = var.sg_name
  environment       = var.environment
  allowed_ssh_cidr  = var.allowed_ssh_cidr
  allowed_http_cidr = var.allowed_http_cidr
}

module "s3" {
  source = "git::https://github.com/nehal-wandhare/terraform-s3-module.git?ref=main"

  bucket_name = var.bucket_name
  environment = var.environment
}

module "rds" {
  source = "git::https://github.com/nehal-wandhare/terraform-rds-module.git?ref=main"

  instance_class = var.db_class
  username       = var.db_user
  password       = var.db_pass
  db_name        = var.db_name
  environment    = var.environment
}

module "ec2" {
  source = "git::https://github.com/nehal-wandhare/terraform-ec2-module.git?ref=main"

  ami                = var.ami
  instance_type      = var.instance_type
  subnet_id          = module.vpc.subnet_id
  key_name           = var.key_name
  security_group_ids = [module.sg.sg_id]
  public_ip          = true
  instance_name      = var.instance_name
  environment        = var.environment

  depends_on = [module.sg]
}