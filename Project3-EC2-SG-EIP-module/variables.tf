variable "region" {
  type        = string
  description = "The region where your resources will be deployed in"
}

//SG

variable "bastion_security_group_name" {
  type        = string
  description = "The name of the security group"
}

variable "bastion_security_group_description" {
  type        = string
  description = "Description of the security group"
}

variable "ec2_security_group_name" {
  type        = string
  description = "The name of the security group"
}

variable "ec2_security_group_description" {
  type        = string
  description = "Description of the security group"
}

//VPC
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR Block of the VPC"
}
variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}
variable "avail_zones" {
  type        = list(string)
  description = "List of the availabilty zones where the subnets will be deployed"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of the CIDRs for the private subnet"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of the CIDRs for the public subnet"
}

variable "database_subnet_cidrs" {
  type        = list(string)
  description = "List of the CIDRs for the database subnet"
}

variable "enable_internet_gateway" {
  type        = bool
  description = "If internet gateway should be created"
}

variable "enable_NAT_gateway" {
  type        = bool
  description = "If NAT Gateway should be enabled in all the public subnets"
}

//EC2
variable "ec2_instance_type" {
    type = string
    description = "Type of the EC2 instance you want to create"
}

variable "ec2_private_instance_count" {
    type = string
    description = "The Number of EC2 instances that you want to create"
}
