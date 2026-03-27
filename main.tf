provider "aws" {
  region = "ap-south-1"
}

# ---------------- VPC ----------------
module "vpc" {
  source = "git::https://github.com/nehal-wandhare/terraform-vpc-module.git"

  cidr_block  = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  vpc_name    = "main-vpc"

  environment = var.environment
}

# ---------------- SG ----------------
module "sg" {
  source = "git::https://github.com/nehal-wandhare/terraform-sg-module.git"

  vpc_id            = module.vpc.vpc_id
  sg_name           = "web-sg"
  environment       = var.environment
  allowed_ssh_cidr  = ["0.0.0.0/0"]
  allowed_http_cidr = ["0.0.0.0/0"]
}

# ---------------- EC2 ----------------
module "ec2" {
  source = "git::https://github.com/nehal-wandhare/terraform-ec2-module.git"

  environment        = var.environment
  instance_name      = var.instance_name
  ami                = "ami-0f58b397bc5c1f2e8"
  instance_type      = "t2.micro"
  subnet_id          = module.vpc.subnet_id
  key_name           = "tirri"
  security_group_ids = [module.sg.sg_id]
  public_ip          = true
}

# ---------------- S3 ----------------
module "s3" {
  source = "git::https://github.com/nehal-wandhare/terraform-s3-module.git"

  bucket_name = "khatrnak-newtirri-tirri-bucket"
  environment = var.environment
  versioning  = true
}
