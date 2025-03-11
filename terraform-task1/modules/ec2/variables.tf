variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "SSH key name to use for the instance"
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data script for the instance"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}

# Added variables for subnet lookup approach
variable "public_subnets" {
  description = "Map of public subnet names to subnet IDs"
  type        = map(string)
  default     = {}
}

variable "private_subnets" {
  description = "Map of private subnet names to subnet IDs"
  type        = map(string)
  default     = {}
}

variable "subnet_type" {
  description = "Type of subnet (public or private)"
  type        = string
  default     = "public"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = ""
}