terraform {
  backend "s3" {
    bucket                      = "spinbet-tf-state-task2"
    key                         = "terraform.tfstate"
    region                      = "us-east-1"
    dynamodb_table              = "terraform-locks-task2"

    # Below LocalStack-specific settings should be removed when using AWS

    endpoint                    = "http://localhost:4566"
    dynamodb_endpoint           = "http://localhost:4566"
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    force_path_style            = true
    skip_metadata_api_check     = true
  }
}