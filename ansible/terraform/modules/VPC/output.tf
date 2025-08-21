output "vpc_id" {
  value       = aws_vpc.vpc_ansible.id
  description = "The ID of the VPC created"
}

output "public_subnet_id" {
  value       = aws_subnet.public_subnet_ansible.id
  description = "ID of the public subnet created in the Ansible VPC"
}

output "security_group_id" {
  value       = aws_security_group.ansible_sg.id
  description = "The ID of the security group created for Ansible managed instances"
}