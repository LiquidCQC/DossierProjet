output "sns_topic_arn" {
  value = aws_sns_topic.restoproch.arn
}

output "sns_topic_subscription_endpoint" {
  value = aws_sns_topic_subscription.email_subscription.endpoint
}
