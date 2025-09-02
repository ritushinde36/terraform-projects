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

variable "app_lb_port" {
    type = number
    description = "port number to allow traffic on"
}

variable "app_lb_protocol" {
    type = string
    description = "protocol to allow traffic on"
}
