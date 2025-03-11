# -------------------------------
# VPC Configuration
# -------------------------------

vpc_name   = "staging-vpc"
vpc_cidr   = "10.0.0.0/16"

public_subnets = {
  "public-1" = "10.0.1.0/24"
  "public-2" = "10.0.2.0/24"
}

private_subnets = {
  "private-1" = "10.0.3.0/24"
  "private-2" = "10.0.4.0/24"
}

# -------------------------------
# EC2 Instances Configuration
# -------------------------------

ec2_instances = {
  "app-server" = {
    ami_id        = "ami-12345678"
    instance_type = "t3.micro"
    subnet_id     = "subnet-abcdef12"
    subnet_type   = "private"
    subnet_name   = "private-1"
    key_name      = "staging-key"
    tags = {
      Name = "staging-app-server"
      Env  = "staging"
    }
  }
}

default_ami_id = "ami-12345"

# -------------------------------
# AWS Config Variables
# -------------------------------

config_bucket_name           = "staging-config-bucket"
config_delivery_channel_name = "staging-config-delivery-channel"
config_recorder_name         = "staging-config-recorder"

# -------------------------------
# CloudWatch Configuration
# -------------------------------

log_group_name      = "staging-log-group"
log_retention_days  = 30
alarm_name          = "staging-unauthorized-api-calls"
evaluation_periods  = 1
alarm_period        = 300
alarm_threshold     = 1
sns_topic_name      = "staging-alerts"
alert_email         = "alerts@staging.com"

# -------------------------------
# IAM Configuration
# -------------------------------

iam_role_name             = "staging-ec2-role"
iam_policy_name           = "staging-ec2-policy"
iam_instance_profile_name = "staging-ec2-profile"

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

cloudtrail_bucket_name                     = "staging-cloudtrail-bucket"
cloudtrail_name                            = "staging-cloudtrail"
cloudtrail_include_global_service_events   = true
cloudtrail_is_multi_region_trail           = true
cloudtrail_enable_log_file_validation      = true

# -------------------------------
# Secrets Manager Configuration
# -------------------------------

secret_name = "staging-credentials"

