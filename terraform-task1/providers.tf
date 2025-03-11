provider "aws" {
  region                      = "us-east-1"
  access_key                  = "localstack"
  secret_key                  = "localstack"

  # Below LocalStack-specific settings should be removed when using AWS

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  endpoints {
    ec2            = "http://localhost:4566"
    s3             = "http://localhost:4566"
    sts            = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    iam            = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
  }
}
