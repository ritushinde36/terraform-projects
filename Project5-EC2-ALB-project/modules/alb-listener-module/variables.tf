variable "app_lb_target_group_arn" {
    type = string
    description = "ARN of the target group"
}

variable "app_lb_arn" {
    type = string
    description = "ARN of the application Load Balancer"
}

variable "app_lb_port" {
    type = number
    description = "port number to allow traffic on"
}

variable "app_lb_protocol" {
    type = string
    description = "protocol to allow traffic on"
}

# variable "app_lb_listener_path" {
#     type = string
#     description = "Path to forward traffic on"
# }