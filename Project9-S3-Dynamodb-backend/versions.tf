terraform {
    required_version = "1.8.3"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.4.0"
        }
    }
    backend "s3" {
        bucket = "tfbackend-385"
        key = "projA/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-state-lock-table"
      
    }
}

provider "aws" {
    region = var.region
}
