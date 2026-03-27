terraform {
  backend "s3" {
    bucket         = "khatrnak-newtirri-tirri-bucket"
    key            = "env/${terraform.workspace}/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "otp-table"
  }
}
