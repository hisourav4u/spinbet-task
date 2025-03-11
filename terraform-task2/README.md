# Terraform Task 2

Task to create a VPC, EC2 instance in private subnet with some security in place using Terraform.

Note: Using localstack in absence of AWS account

## Prerequisites

- Terraform installed
- LocalStack installed
- AWS CLI installed

## Setup LocalStack

1. **Install LocalStack**:
    ```sh
    pip install localstack
    ```

2. **Start LocalStack**:
    ```sh
    localstack start
    ```

3. **Configure AWS CLI**:
    ```sh
    aws configure
    ```
    Use the following values:
    - AWS Access Key ID: `test`
    - AWS Secret Access Key: `test`
    - Default region name: `us-east-1`
    - Default output format: `json`

## Terraform Configuration

0. **Initialize S3 and dynamodb**:
    ```sh
    aws --endpoint-url=http://localhost:4566 s3 mb s3://spinbet-tf-state-task2

    aws --endpoint-url=http://localhost:4566 dynamodb create-table --table-name terraform-locks-task2 --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST 
    ```

1. **Initialize Terraform**:
    ```sh
    terraform init
    ```

2. **Create Terraform Workspace**:
    ```sh
    terraform workspace new staging/production
    ```

3. **Create Terraform Plan**:
    ```sh
    terraform plan -var-file="envs/staging.tfvars"
    ```

4. **Apply Terraform Configuration**:
    ```sh
    terraform apply -var-file="envs/staging.tfvars"
    ```

## Resources Created

### VPC Module
- **VPC**: A Virtual Private Cloud to host your resources.
- **Public Subnets**: Subnets for public resources.
- **Private Subnets**: Subnets for private resources.

### Security Group Module
- **Security Group for EC2 Instances**: A security group to control inbound and outbound traffic for EC2 instances.

### IAM Module
- **IAM Role**: A role for EC2 instances.
- **IAM Policy**: A policy attached to the IAM role.
- **IAM Instance Profile**: An instance profile for EC2 instances.

### EC2 Instances Module
- **EC2 Instances**: Virtual servers to run your applications.

### CloudTrail Module
- **CloudTrail**: A service to log AWS API calls.
- **S3 Bucket for CloudTrail Logs**: A bucket to store CloudTrail logs.

### AWS Config Module
- **Configuration Recorder**: A recorder to capture configuration changes.
- **Delivery Channel**: A channel to deliver configuration snapshots.
- **S3 Bucket for Config Logs**: A bucket to store AWS Config logs.

### CloudWatch Alarms Module
- **CloudWatch Log Group**: A log group to store CloudWatch logs.
- **CloudWatch Metric Filter**: A filter to create metrics from logs.
- **CloudWatch Alarm**: An alarm to monitor unauthorized API calls.
- **SNS Topic**: A topic to send notifications.
- **SNS Topic Subscription**: A subscription to receive notifications via email.

### Secrets Manager Module
- **Secrets Manager Secret**: A secret to store sensitive information.

## Cleanup

To destroy the created resources, run:
```sh
terraform destroy
```

