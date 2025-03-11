variable "instance_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "subnet_type" {
  type    = string
  default = "public"
}

variable "subnet_name" {
  type    = string
  default = ""
}

variable "public_subnets" {
  type = map(string)
}

variable "private_subnets" {
  type = map(string)
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "key_name" {
  type    = string
  default = null
}

variable "user_data" {
  type    = string
  default = null
}

variable "iam_instance_profile" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
