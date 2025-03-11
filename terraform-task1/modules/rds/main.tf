locals {
  # Determine the subnet group name:
  # - If `create_subnet_group` is true, use the newly created DB subnet group.
  # - Otherwise, use the existing `db_subnet_group_name` provided.
  subnet_group_name = var.create_subnet_group ? aws_db_subnet_group.this[0].name : var.db_subnet_group_name
  
  # If subnet_ids are provided, use them directly
  # Otherwise, look up IDs from private_subnets using subnet_names
  subnet_ids = length(var.subnet_ids) > 0 ? var.subnet_ids : [
    for name in var.subnet_names : var.private_subnets[name]
  ]
}

# Create DB subnet group if requested
resource "aws_db_subnet_group" "this" {
  count = var.create_subnet_group ? 1 : 0
  
  name       = var.subnet_group_name != null ? var.subnet_group_name : "${var.identifier}-subnet-group"
  subnet_ids = local.subnet_ids
  
  tags = merge(
    {
      Name = var.subnet_group_name != null ? var.subnet_group_name : "${var.identifier}-subnet-group"
    },
    var.tags
  )
}

# Create RDS instance
resource "aws_db_instance" "this" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = local.subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  publicly_accessible    = var.publicly_accessible
  
  # Additional configuration
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  multi_az                = var.multi_az
  port                    = var.port
  db_name                 = var.db_name
  
  tags = merge(
    {
      Name = var.identifier
    },
    var.tags
  )
}