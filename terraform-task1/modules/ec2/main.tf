locals {
  # Determine the subnet ID based on user input:
  # - If `subnet_id` is provided, use it directly.
  # - Otherwise, select a subnet based on `subnet_type` (public or private).
  subnet_id = var.subnet_id != null ? var.subnet_id : (
    var.subnet_type == "public" ? var.public_subnets[var.subnet_name] : var.private_subnets[var.subnet_name]
  )

  # Assign a public IP only if the instance is in a public subnet.
  assign_public_ip = var.subnet_type == "public" ? true : false
}

resource "aws_instance" "instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = local.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  user_data              = var.user_data
  associate_public_ip_address = local.assign_public_ip

  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )
}