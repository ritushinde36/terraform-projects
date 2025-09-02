terraform {
  required_version = "1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.4"
    }
  }
}

provider "aws" {
  region = var.region
}