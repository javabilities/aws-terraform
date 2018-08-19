provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "javabilities-tfstate" {
  bucket = "javabilities-tfstate"
  acl = "private"
  force_destroy = true
  versioning {
    enabled  = true
  }
}

terraform {
  backend "s3" {
    bucket = "javabilities-tfstate"
    key = "setup/terraform.tfstate"
    region = "us-east-1"
  }
}
