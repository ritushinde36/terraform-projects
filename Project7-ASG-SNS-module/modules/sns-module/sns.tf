resource "aws_sns_topic" "asg_sns_topic" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "asg_sns_topic_subscription" {
    topic_arn = aws_sns_topic.asg_sns_topic.arn
    protocol = "email"
    endpoint = var.receiver_email_address
}
