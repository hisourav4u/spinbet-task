resource "aws_iam_role" "role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "policy" {
  name = var.iam_policy_name
  role = aws_iam_role.role.id

  policy = var.iam_policy_document
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.role.name
}