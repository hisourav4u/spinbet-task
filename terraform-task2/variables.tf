# VPC variables

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = map(string)
}

variable "private_subnets" {
  type = map(string)
}

# EC2 Variables

variable "ec2_instances" {
  type = map(object({
    ami_id        = string
    instance_type = string
    subnet_id     = string
    subnet_type   = string
    subnet_name   = string
    key_name      = string
    tags          = map(string)
  }))
}

variable "default_ami_id" {
  type    = string
  default = "ami-12345"
}

variable "secret_name" {
  type = string
}

# AWS config variables

variable "config_bucket_name" {
  type = string
}

variable "config_delivery_channel_name" {
  type    = string
  default = "config-delivery-channel"
}

variable "config_recorder_name" {
  type    = string
  default = "config-recorder"
}

# CloudWatch Variables

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

# IAM variables

variable "iam_role_name" {
  type    = string
  default = "ec2-instance-role"
}

variable "iam_policy_name" {
  type    = string
  default = "ec2-instance-policy"
}

variable "iam_instance_profile_name" {
  type    = string
  default = "ec2-instance-profile"
}

variable "iam_policy_document" {
  type    = string
  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# CloudTrail Variables

variable "cloudtrail_bucket_name" {
  type = string
}

variable "cloudtrail_name" {
  type    = string
  default = "account-trail"
}

variable "cloudtrail_include_global_service_events" {
  type    = bool
  default = true
}

variable "cloudtrail_is_multi_region_trail" {
  type    = bool
  default = true
}

variable "cloudtrail_enable_log_file_validation" {
  type    = bool
  default = true
}