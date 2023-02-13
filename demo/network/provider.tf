terraform {
  required_providers {
    aws = ">= 3.35.0"
  }
}

#provider "aws" {
#  profile = var.profile
#  region  = var.region
#}

terraform {
  backend "s3" {
    bucket = "demo-bucket-terraform-subhajit"
    key    = "demo/networking/vpc"
    region = "var.region"
    profile = "var.profile"
  }
}
