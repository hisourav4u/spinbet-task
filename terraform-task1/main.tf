module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# Create security group for EC2 instances
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instances"
  vpc_id      = module.vpc.vpc_id

  # Allows SSH within the VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Allows all outbound traffic
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-security-group"
  }
}

module "ec2_instances" {
  source   = "./modules/ec2"
  for_each = var.ec2_instances

  instance_name = each.key
  ami_id        = lookup(each.value, "ami_id", var.default_ami_id)
  instance_type = lookup(each.value, "instance_type", "t2.micro")

  subnet_id       = lookup(each.value, "subnet_id", null)
  subnet_type     = lookup(each.value, "subnet_type", "public")
  subnet_name     = lookup(each.value, "subnet_name", "")
  public_subnets  = module.vpc.public_subnet_ids
  private_subnets = module.vpc.private_subnet_ids

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = lookup(each.value, "key_name", null)
  user_data              = lookup(each.value, "user_data", null)
  tags                   = lookup(each.value, "tags", {})
}


# Create security group for RDS instances
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for RDS instances"
  vpc_id      = module.vpc.vpc_id

  # Allow database connections from EC2 instances
  ingress {
    from_port       = 3306  # MySQL default
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}

# Create RDS instances
module "rds_instances" {
  source   = "./modules/rds"
  for_each = var.rds_instances

  identifier             = each.key
  allocated_storage      = lookup(each.value, "allocated_storage", 20)
  storage_type           = lookup(each.value, "storage_type", "gp2")
  engine                 = lookup(each.value, "engine", "mysql")
  engine_version         = lookup(each.value, "engine_version", "8.0")
  instance_class         = lookup(each.value, "instance_class", "db.t3.micro")
  username               = lookup(each.value, "username", "admin")
  password               = lookup(each.value, "password", "Password123!")
  parameter_group_name   = lookup(each.value, "parameter_group_name", null)
  skip_final_snapshot    = lookup(each.value, "skip_final_snapshot", true)
  publicly_accessible    = lookup(each.value, "publicly_accessible", false)
  
  # Subnet configuration
  create_subnet_group   = lookup(each.value, "create_subnet_group", true)
  subnet_group_name     = lookup(each.value, "subnet_group_name", null)
  subnet_ids            = lookup(each.value, "subnet_ids", [])
  private_subnets       = module.vpc.private_subnet_ids
  subnet_names          = lookup(each.value, "subnet_names", [])
  
  # Security groups
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  
  # Additional configuration
  multi_az               = lookup(each.value, "multi_az", false)
  backup_retention_period = lookup(each.value, "backup_retention_period", 7)
  db_name                = lookup(each.value, "db_name", null)
  port                   = lookup(each.value, "port", null)
  
  tags = lookup(each.value, "tags", {})
}