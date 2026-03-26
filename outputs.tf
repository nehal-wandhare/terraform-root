output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "s3_bucket_id" {
  value = module.s3.bucket_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "security_group_id" {
  value = module.sg.sg_id
}