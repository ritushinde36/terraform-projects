variable "ec2_instance_type" {
    type = string
    description = "Type of the EC2 instance you want to create"
}

variable "ec2_instance_name" {
    type = string
    description = "Name of the EC2 instance"
    default = "Example_EC2"
}

variable "ec2_instance_ami" {
    type = string
    description = "The ami of the EC2"
    default = null
}

variable "ec2_instance_count" {
    type = string
    description = "The Number of EC2 instances that you want to create"
    default = 1
}

variable "ec2_key_name" {
    type = string
    description = "The key used to ssh into the ec2 instance"
    default = ""
}

variable "ec2_security_group_ids" {
    type = list(string)
    description = "List of security groups attached to the EC2"
    default = []
}

variable "ec2_instance_subnet_ids" {
    type = list(string)
    description = "List of subnets IDs that the EC2 should be created it"
}

variable "ec2_user_data" {
    type = string
    description = "User data script for the EC2 to run on boot time"
    default = ""
}