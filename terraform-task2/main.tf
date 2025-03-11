# VPC Module
module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# Security Group Module
module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

# IAM Module
module "iam" {
  source = "./modules/iam"

  iam_role_name             = var.iam_role_name
  iam_policy_name           = var.iam_policy_name
  iam_instance_profile_name = var.iam_instance_profile_name
  iam_policy_document       = var.iam_policy_document
}


# EC2 Instances Module
module "ec2_instances" {
  source   = "./modules/ec2"
  for_each = var.ec2_instances

  instance_name          = each.key
  ami_id                 = lookup(each.value, "ami_id", var.default_ami_id)
  instance_type          = lookup(each.value, "instance_type", "t2.micro")
  subnet_id              = lookup(each.value, "subnet_id", null)
  subnet_type            = lookup(each.value, "subnet_type", "public")
  subnet_name            = lookup(each.value, "subnet_name", "")
  public_subnets         = module.vpc.public_subnet_ids
  private_subnets        = module.vpc.private_subnet_ids
  vpc_security_group_ids = [module.security_group.ec2_sg_id]
  key_name               = lookup(each.value, "key_name", null)
  user_data              = lookup(each.value, "user_data", null)
  iam_instance_profile   = module.iam.iam_instance_profile_name
  tags                   = lookup(each.value, "tags", {})
}

# CloudTrail Module
module "cloudtrail" {
  source = "./modules/cloudtrail"

  cloudtrail_bucket_name                   = var.cloudtrail_bucket_name
  cloudtrail_name                          = var.cloudtrail_name
  cloudtrail_include_global_service_events = var.cloudtrail_include_global_service_events
  cloudtrail_is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  cloudtrail_enable_log_file_validation    = var.cloudtrail_enable_log_file_validation
}

# AWS Config Module
module "aws_config" {
  source = "./modules/aws-config"

  config_bucket_name           = var.config_bucket_name
  config_delivery_channel_name = var.config_delivery_channel_name
  config_recorder_name         = var.config_recorder_name
}

# CloudWatch Alarms Module
module "cloudwatch" {
  source             = "./modules/cloudwatch"
  log_group_name     = var.log_group_name
  log_retention_days = var.log_retention_days
  alarm_name         = var.alarm_name
  evaluation_periods = var.evaluation_periods
  alarm_period       = var.alarm_period
  alarm_threshold    = var.alarm_threshold
  sns_topic_name     = var.sns_topic_name
  alert_email        = var.alert_email
}

# Secrets Manager Module
module "secrets_manager" {
  source      = "./modules/secrets-manager"
  secret_name = var.secret_name
}