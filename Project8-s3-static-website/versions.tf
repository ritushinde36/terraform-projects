terraform {
    required_version = "1.8.3"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "6.4.0"
      }
    }
}

provider "aws" {
    region = var.region
  
}