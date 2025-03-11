variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "ec2_instances" {
  description = "Map of EC2 instances to create"
  type        = map(any)
}

variable "default_ami_id" {
  description = "Default AMI ID to use for EC2 instances"
  type        = string
}

variable "rds_instances" {
  description = "Map of RDS instances to create"
  type        = map(any)
}