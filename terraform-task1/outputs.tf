output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "ec2_instance_ids" {
  value = { for k, v in module.ec2_instances : k => v.instance_id }
}

output "ec2_private_ips" {
  value = { for k, v in module.ec2_instances : k => v.private_ip }
}

output "ec2_public_ips" {
  value = { for k, v in module.ec2_instances : k => v.public_ip }
}

output "rds_instance_endpoints" {
  value = { for k, v in module.rds_instances : k => v.endpoint }
}

output "rds_instance_addresses" {
  value = { for k, v in module.rds_instances : k => v.address }
}