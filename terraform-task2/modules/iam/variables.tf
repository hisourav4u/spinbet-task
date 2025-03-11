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