resource "aws_lb" "app_lb" {
    name = var.app_lb_name
    internal = var.is_alb_internal
    load_balancer_type = "application"
    security_groups  = var.app_lb_sg_ids
    subnets = var.app_lb_subnet_ids
} 
