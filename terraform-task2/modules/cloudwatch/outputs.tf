output "cloudwatch_alarm_arn" {
  description = "ARN of the CloudWatch Alarm"
  value       = aws_cloudwatch_metric_alarm.unauthorized_api_alarm.arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS Topic for notifications"
  value       = aws_sns_topic.alerts.arn
}
