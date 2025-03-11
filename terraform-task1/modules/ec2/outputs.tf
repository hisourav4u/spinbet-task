output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.instance.id
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.instance.private_ip
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.instance.public_ip
}