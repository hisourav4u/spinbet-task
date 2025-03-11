variable "identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Database engine (mysql, postgres, etc.)"
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "Name of the parameter group to associate with the RDS instance"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = true
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group to associate with the RDS instance"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS instance"
  type        = list(string)
  default     = []
}

variable "publicly_accessible" {
  description = "Specifies whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags for the RDS instance"
  type        = map(string)
  default     = {}
}

# Variables for subnet group creation
variable "create_subnet_group" {
  description = "Whether to create a DB subnet group"
  type        = bool
  default     = true
}

variable "subnet_group_name" {
  description = "Name of the DB subnet group to create"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Subnet IDs to include in the DB subnet group"
  type        = list(string)
  default     = []
}

# Variables for using private subnet lookup
variable "private_subnets" {
  description = "Map of private subnet names to subnet IDs"
  type        = map(string)
  default     = {}
}

variable "subnet_names" {
  description = "List of subnet names to use for the DB subnet group"
  type        = list(string)
  default     = []
}

# Backup configuration
variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Preferred backup window"
  type        = string
  default     = "03:00-06:00"  # UTC
}

variable "maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
  default     = "Mon:00:00-Mon:03:00"  # UTC
}

# Multi-AZ configuration
variable "multi_az" {
  description = "Whether to deploy a multi-AZ RDS instance"
  type        = bool
  default     = false
}

# Database parameters
variable "port" {
  description = "Database port"
  type        = number
  default     = null  # Will default to engine standard port
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
  default     = null
}