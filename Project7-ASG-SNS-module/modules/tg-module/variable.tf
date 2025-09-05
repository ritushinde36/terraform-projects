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

variable "app_lb_tg_health_check_path" {
    type = string
    description = "Path of the health check for EC2"
}