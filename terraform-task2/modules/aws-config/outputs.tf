output "config_bucket_name" {
  value = aws_s3_bucket.config_bucket.bucket
}

output "config_recorder_name" {
  value = aws_config_configuration_recorder.config_recorder.name
}