output "app_lb_arn" {
    description = "ARN of the application load balancer"
    value = aws_lb.app_lb.arn
}