output "app_lb_arn" {
    description = "ARN of the application load balancer"
    value = aws_lb.app_lb.arn
}

output "alb_arn_suffix" {
    description = "ARN suffix of the ALB"
    value = aws_lb.app_lb.arn_suffix
}