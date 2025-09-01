variable "app_lb_target_group_name" {
    type = string
    description = "Name of the target group"
    default = "Example-TG"
}

variable "app_lb_port" {
    type = number
    description = "port number to allow traffic on"
}

variable "app_lb_protocol" {
    type = string
    description = "protocol to allow traffic on"
}

variable "alb_vpc_id" {
    type = string
    description = "VPC ID in which the ALB and TGs will be in"
}

variable "app_lb_tg_instance_ids" {
    type = list(string)
    description = "List of instance ids to add in the target group"
}

variable "app_lb_name" {
    type = string
    description = "Name of the application Load Balancer"
    default = "Example-ALB"
}

variable "is_alb_internal" {
    type =  bool
    description = "Is the ABL and internal or public facing"
    default = false
}

variable "app_lb_sg_ids" {
    type = list(string)
    description = "List of sg ids attached to the ALB" 
}

variable "app_lb_subnet_ids" {
    type = list(string)
    description = "List of subnet ids that the ALB is present in"
  
}