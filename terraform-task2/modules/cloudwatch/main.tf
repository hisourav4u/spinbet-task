resource "aws_cloudwatch_log_group" "trail_logs" {
  name              = var.log_group_name
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_log_metric_filter" "unauthorized_api_calls" {
  name           = "UnauthorizedAPICalls"
  log_group_name = aws_cloudwatch_log_group.trail_logs.name

  pattern = "{ $.errorCode = \"*UnauthorizedOperation\" || $.errorCode = \"AccessDenied*\" }"

  metric_transformation {
    name      = "UnauthorizedAPICalls"
    namespace = "Security"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "unauthorized_api_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = aws_cloudwatch_log_metric_filter.unauthorized_api_calls.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.unauthorized_api_calls.metric_transformation[0].namespace
  period              = var.alarm_period
  statistic           = "Sum"
  threshold           = var.alarm_threshold
  alarm_description   = "Triggers when unauthorized API calls are detected"
  alarm_actions       = [aws_sns_topic.alerts.arn]
}

resource "aws_sns_topic" "alerts" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}
