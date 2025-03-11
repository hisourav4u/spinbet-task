locals {
  subnet_id = var.subnet_id != null ? var.subnet_id : (
    var.subnet_type == "public" ? var.public_subnets[var.subnet_name] : var.private_subnets[var.subnet_name]
  )
  assign_public_ip = var.subnet_type == "public" ? true : false
}

resource "aws_instance" "instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = local.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  key_name                    = var.key_name
  associate_public_ip_address = local.assign_public_ip
  iam_instance_profile        = var.iam_instance_profile

  root_block_device {
    encrypted = true
  }

  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )
}