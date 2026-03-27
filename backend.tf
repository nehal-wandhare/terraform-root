terraform {
  backend "s3" {
    bucket         = "dev-khatrnak-newtirri-tirri-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile   = true
  }
}
