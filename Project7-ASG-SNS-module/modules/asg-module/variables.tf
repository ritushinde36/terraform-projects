variable "lt_name"{
    type = string
    description = "Name of the launch template"
}

variable "lt_instance_ami" {
    type = string
    description = "AMI ID of the instance"
    default = null
}

variable "lt_instance_type" {
    type = string
    description = "Type of the instance to create"
}

variable "lt_vpc_security_group_ids" {
    type = list(string)
    description = "List of security group ids"
}

variable "lt_key_name" {
    type = string
    description = "Key name for the EC2"
}

variable "lt_user_data" {
    type = string
    description = "User data script for the EC2 to run on boot time"
    default = ""
}

variable "lt_device_name" {
    type = string
    description = "Name of the EBS volume"
}

variable "lt_detailed_monitoring" {
    type = bool
    description = "If detailed monitoring should be enabled"
}

variable "asg_name" {
    type = string
    description = "Name of the auto scaling group"
}
variable "asg_desired_capacity" {
    type = number
    description = "Number of Instances to spin up"
}
variable "asg_max_size" {
    type = number
    description = "Minimum number of instances"
}
variable "asg_min_size" {
    type = number
    description = "Maximum number of instanced"
}
variable "asg_subnet_ids" {
    type = list(string)
    description = "List of subnet IDs to spin up the EC2 instances"
}

variable "asg_tg_arn" {
    type = string
    description = "ARN of the target group"
  
}

variable "sns_topic_arn" {
    type = string
    description = "The arn of the sns topic on which the asg notifications will be sent"
}

variable "alb_arn_suffix" {
    type = string
    description = "ARN suffix of the ALB"
}

variable "tg_arn_suffix" {
    type =string
    description = "ARN suffic of the TG"
  
}