# -------------------------------
# VPC Configuration
# -------------------------------

vpc_name   = "production-vpc"
vpc_cidr   = "10.1.0.0/16"

public_subnets = {
  "public-1" = "10.1.1.0/24"
  "public-2" = "10.1.2.0/24"
}

private_subnets = {
  "private-1" = "10.1.3.0/24"
  "private-2" = "10.1.4.0/24"
}

# -------------------------------
# EC2 Instances Configuration
# -------------------------------

ec2_instances = {
  "app-server" = {
    ami_id        = "ami-87654321"
    instance_type = "t3.medium"
    subnet_id     = "subnet-fedcba21"
    subnet_type   = "private"
    subnet_name   = "private-1"
    key_name      = "production-key"
    tags = {
      Name = "production-app-server"
      Env  = "production"
    }
  }
}

default_ami_id = "ami-54321"

# -------------------------------
# AWS Config Variables
# -------------------------------

config_bucket_name           = "production-config-bucket"
config_delivery_channel_name = "production-config-delivery-channel"
config_recorder_name         = "production-config-recorder"

# -------------------------------
# CloudWatch Configuration
# -------------------------------

log_group_name      = "production-log-group"
log_retention_days  = 90
alarm_name          = "production-unauthorized-api-calls"
evaluation_periods  = 2
alarm_period        = 300
alarm_threshold     = 2
sns_topic_name      = "production-alerts"
alert_email         = "alerts@production.com"

# -------------------------------
# IAM Configuration
# -------------------------------

iam_role_name             = "production-ec2-role"
iam_policy_name           = "production-ec2-policy"
iam_instance_profile_name = "production-ec2-profile"

iam_policy_document = <<EOF
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

# -------------------------------
# CloudTrail Configuration
# -------------------------------

cloudtrail_bucket_name                     = "production-cloudtrail-bucket"
cloudtrail_name                            = "production-cloudtrail"
cloudtrail_include_global_service_events   = true
cloudtrail_is_multi_region_trail           = true
cloudtrail_enable_log_file_validation      = true

# -------------------------------
# Secrets Manager Configuration
# -------------------------------

secret_name = "production-credentials"
