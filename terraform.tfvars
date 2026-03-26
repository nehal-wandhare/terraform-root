# VPC
vpc_cidr    = "10.0.0.0/16"
subnet_cidr = "10.0.1.0/24"
vpc_name    = "new-vpc"

# SG
sg_name = "my-sg"
allowed_ssh_cidr  = ["0.0.0.0/0"]
allowed_http_cidr = ["0.0.0.0/0"]

# Common
environment = "dev"

# EC2
ami            = "ami-0f5ee92e2d63afc18"
instance_type  = "t3.micro"
key_name       = "your-keypair-name"
instance_name  = "my-ec2"

# S3
bucket_name = "nehal-final-terraform-bucket-12345"

# RDS
db_class = "db.t3.micro"
db_user  = "admin"
db_pass  = "Password123!"
db_name  = "mydb"
