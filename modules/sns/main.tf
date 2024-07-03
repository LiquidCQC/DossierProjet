resource "aws_sns_topic" "restoproch" {
  name              = "restoproch"
  kms_master_key_id = var.kms_key_id
}


resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.restoproch.arn
  protocol  = "email"
  endpoint  = var.email
}

