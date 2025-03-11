output "iam_role_arn" {
  value = aws_iam_role.role.arn
}

output "iam_policy_name" {
  value = aws_iam_role_policy.policy.name
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.instance_profile.name
}