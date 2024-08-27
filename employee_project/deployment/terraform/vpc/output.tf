output "vpc_id" {
  value       = aws_vpc.praneethdev-vpc.id
  description = "VPC Id"
  sensitive   = false
}

output "public_1_subnet_id" {
  value       = aws_subnet.public_1.id
  description = "VPC Id"
  sensitive   = false
}

output "public_2_subnet_id" {
  value       = aws_subnet.public_2.id
  description = "VPC Id"
  sensitive   = false
}

output "private_1_subnet_id" {
  value       = aws_subnet.private_1.id
  description = "VPC Id"
  sensitive   = false
}

output "private_2_subnet_id" {
  value       = aws_subnet.private_2.id
  description = "VPC Id"
  sensitive   = false
}
