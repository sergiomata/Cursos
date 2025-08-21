output "ec2_instance_ip" {
  value       = aws_instance.ec2_instance_ansible.public_ip
  description = "The public IP address of the EC2 instance created"
}