output "cloudtrail_name" {
  value = aws_cloudtrail.trail.name
}

output "cloudtrail_bucket_name" {
  value = aws_s3_bucket.cloudtrail_bucket.bucket
}
