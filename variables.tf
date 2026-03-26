# VPC
variable "vpc_cidr" {}
variable "subnet_cidr" {}
variable "vpc_name" {}

# SG
variable "sg_name" {}
variable "allowed_ssh_cidr" {
  type = list(string)
}
variable "allowed_http_cidr" {
  type = list(string)
}

# Common
variable "environment" {}

# EC2
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "instance_name" {}

# S3
variable "bucket_name" {}

# RDS
variable "db_class" {}
variable "db_user" {}
variable "db_pass" {}
variable "db_name" {}