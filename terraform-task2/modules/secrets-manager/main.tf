resource "aws_secretsmanager_secret" "secret" {
  name = var.secret_name
}
