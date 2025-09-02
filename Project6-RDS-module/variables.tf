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

//ALB
variable "app_lb_target_group_name" {
    type = string
    description = "Name of the target group"
}

variable "app_lb_port" {
    type = number
    description = "port number to allow traffic on"
}

variable "app_lb_protocol" {
    type = string
    description = "protocol to allow traffic on"
}

variable "app_lb_name" {
    type = string
    description = "Name of the application Load Balancer"
}

variable "is_alb_internal" {
    type =  bool
    description = "Is the ABL and internal or public facing"
}

variable "app_lb_sg_name" {
  type = string
  description = "Name of the SG attached to the ALB"
}

variable "app_lb_sg_description" {
  type = string
  description = "Description of the security group"
}

// RDS
variable "rds_sg_name" {
  type = string
  description = "Name of the security group for RDS"
}

variable "rds_sg_description"{
  type = string
  description = "Description on the security group"
}

variable "rds_name" {
    type = string
    description = "Name of the RDS DB"
}

variable "rds_username" {
    type = string
    description = "Useename of the RDS DB"
}

variable "rds_password" {
    type = string
    description = "password of the rds DB"
    sensitive = true 
}

variable "rds_engine" {
    type = string
    description = "value of the RDS engine"
}

variable "rds_engine_version" {
    type = string
    description = "Value of the engine version of the RDS DB"
}

variable "rds_instance_class" {
    type = string
    description = "The value of the RDS instance class"
}

variable "rds_allocated_storage" {
    type = number
    description = "storage in GB"
}
variable "rds_port" {
    type = number
    description = "The port on which the db accepts connection"
}

