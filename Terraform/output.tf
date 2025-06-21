output "vpc_id" {
  description = "VPC ID created"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "Public subnet ID created"
  value       = module.vpc.public_subnet_id
}

output "security_group_id" {
  description = "Security Group ID created"
  value       = module.security_group.sg_id
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = module.ec2.public_ip
}
