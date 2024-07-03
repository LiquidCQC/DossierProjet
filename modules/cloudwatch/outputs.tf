output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.data_alarm.alarm_name
}

output "alarm_description" {
  value = aws_cloudwatch_metric_alarm.data_alarm.alarm_description
}

output "actions_enabled" {
  value = aws_cloudwatch_metric_alarm.data_alarm.actions_enabled
}

output "alarm_actions" {
  value = aws_cloudwatch_metric_alarm.data_alarm.alarm_actions
}

output "ok_actions" {
  value = aws_cloudwatch_metric_alarm.data_alarm.ok_actions
}

output "insufficient_data_actions" {
  value = aws_cloudwatch_metric_alarm.data_alarm.insufficient_data_actions
}

output "comparison_operator" {
  value = aws_cloudwatch_metric_alarm.data_alarm.comparison_operator
}

output "evaluation_periods" {
  value = aws_cloudwatch_metric_alarm.data_alarm.evaluation_periods
}

output "threshold" {
  value = aws_cloudwatch_metric_alarm.data_alarm.threshold
}

output "unit" {
  value = aws_cloudwatch_metric_alarm.data_alarm.unit
}

output "datapoints_to_alarm" {
  value = aws_cloudwatch_metric_alarm.data_alarm.datapoints_to_alarm
}

output "metric_name" {
  value = aws_cloudwatch_metric_alarm.data_alarm.metric_name
}

output "namespace" {
  value = aws_cloudwatch_metric_alarm.data_alarm.namespace
}

output "period" {
  value = aws_cloudwatch_metric_alarm.data_alarm.period
}

output "statistic" {
  value = aws_cloudwatch_metric_alarm.data_alarm.statistic
}

output "extended_statistic" {
  value = aws_cloudwatch_metric_alarm.data_alarm.extended_statistic
}

output "dimensions" {
  value = aws_cloudwatch_metric_alarm.data_alarm.dimensions
}