variable "log_group_name" {
  description = "Name of the CloudWatch log group"
  type        = string
}

variable "log_retention_days" {
  description = "Retention period for log group"
  type        = number
}

variable "alarm_name" {
  description = "Name of the CloudWatch Alarm"
  type        = string
}

variable "evaluation_periods" {
  description = "Number of periods before triggering an alarm"
  type        = number
}

variable "alarm_period" {
  description = "Duration of each period (seconds)"
  type        = number
}

variable "alarm_threshold" {
  description = "Threshold value for triggering the alarm"
  type        = number
}

variable "sns_topic_name" {
  description = "SNS Topic for alerts"
  type        = string
}

variable "alert_email" {
  description = "Email address to receive alerts"
  type        = string
}
