# VPC Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

# Security Group Outputs
output "ec2_sg_id" {
  value = module.security_group.ec2_sg_id
}

# IAM Outputs
output "iam_role_arn" {
  value = module.iam.iam_role_arn
}

output "iam_policy_name" {
  value = module.iam.iam_policy_name
}

output "iam_instance_profile_name" {
  value = module.iam.iam_instance_profile_name
}

# CloudTrail Outputs
output "cloudtrail_name" {
  value = module.cloudtrail.cloudtrail_name
}

output "cloudtrail_bucket_name" {
  value = module.cloudtrail.cloudtrail_bucket_name
}

# CloudWatch Alarms Outputs
output "cloudwatch_alarm_arn" {
  value = module.cloudwatch.cloudwatch_alarm_arn
}

output "sns_topic_arn" {
  value = module.cloudwatch.sns_topic_arn
}

# EC2 Instances Outputs
output "ec2_instance_ids" {
  value = { for k, v in module.ec2_instances : k => v.instance_id }
}

output "ec2_public_ips" {
  value = { for k, v in module.ec2_instances : k => v.public_ip }
}

output "ec2_private_ips" {
  value = { for k, v in module.ec2_instances : k => v.private_ip }
}

# Secrets manager outputs
output "secret_arn" {
  value = module.secrets_manager.secret_arn
}

# AWS config outputs
output "config_bucket_name" {
  value = module.aws_config.config_bucket_name
}

output "config_recorder_name" {
  value = module.aws_config.config_recorder_name
}