output "ec2_instance_ip" {
  value       = module.ec2_instance.ec2_instance_ip
  description = "The public IP address of the EC2 instance created"
}