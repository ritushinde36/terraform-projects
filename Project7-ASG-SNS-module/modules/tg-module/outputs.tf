output "tg_arn" {
    description = "The ARN of the target group created"
    value = aws_lb_target_group.app_lb_tg.arn
}

output "tg_arn_suffix" {
    description = "ARN suffix of TG"
    value = aws_lb_target_group.app_lb_tg.arn_suffix
}