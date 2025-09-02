variable "classic_load_balancer_name" {
    type = string
    description = "Name of the classic load balancer"
    default = "Example-CLB"
}

variable "classic_load_balancer_avail_zones"{
    type = list(string)
    description = "The list of availability zones the CLB will send traffic to"
}

variable "classic_load_balancer_listeners" {
    type = list(map(string))
    description = "List of listeners, defined in a map structure"
}

variable "classic_load_balancer_health_check" {
    type =object(
      {
        target              = string
        interval            = number
        healthy_threshold   = number
        unhealthy_threshold = number
        timeout             = number
      })
    description = "The health check block for the load balancer"
}

variable "classic_load_balancer_instance_ids"{
    type = list(string)
    description = "List of all the instance ids"
}

variable "classic_load_balancer_enable_cross_zone_load_balancing" {
    type = bool
    description = "If cross zone load balancing should be enabled"
  
}

variable "classic_load_balancer_security_groups" {
    type = list(string)
    description = "List of security groups attached to the CLB"
}

