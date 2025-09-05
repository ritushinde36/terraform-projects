output "sns_topic_arn" {
    value = aws_sns_topic.asg_sns_topic.arn
    description = "ARN of the SNS topic created"
}