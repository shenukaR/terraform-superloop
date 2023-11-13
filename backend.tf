terraform {
  backend "s3" {
    bucket         = "shenuka-ansible"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
  }
}
