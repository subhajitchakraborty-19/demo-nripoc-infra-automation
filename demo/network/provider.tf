terraform {
  required_providers {
    aws = ">= 3.35.0"
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}
