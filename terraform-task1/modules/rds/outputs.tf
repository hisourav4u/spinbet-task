output "id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.this.id
}

output "arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.this.arn
}

output "endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.this.endpoint
}

output "address" {
  description = "The hostname of the RDS instance"
  value       = aws_db_instance.this.address
}

output "port" {
  description = "The port on which the DB accepts connections"
  value       = aws_db_instance.this.port
}

output "subnet_group_id" {
  description = "The ID of the DB subnet group"
  value       = var.create_subnet_group ? aws_db_subnet_group.this[0].id : var.db_subnet_group_name
}

output "subnet_group_arn" {
  description = "The ARN of the DB subnet group"
  value       = var.create_subnet_group ? aws_db_subnet_group.this[0].arn : null
}