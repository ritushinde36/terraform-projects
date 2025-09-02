output "tg_arn" {
    description = "The ARN of the target group created"
    value = aws_lb_target_group.app_lb_tg.arn
}