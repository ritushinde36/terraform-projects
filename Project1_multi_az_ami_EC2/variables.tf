variable "region" {
  default     = "us-east-1"
  type        = string
  description = "The AWS region to deploy resources in"
}

variable "instanceType" {
  default     = "t3.micro"
  type        = string
  description = "The type of EC2 instance"
}

