# Terraform Version Block
terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
  /*
  backend "s3" {
    bucket = "multi-purpose-office-bkt"
    key    = "dev/iam/terraform.tfstate"
    region = "us-east-1" 
  } 
  */
}
