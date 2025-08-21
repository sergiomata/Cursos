output "ec2_instance_ips" {
  value = { for k, inst in aws_instance.ec2_instances : k => inst.public_ip }
  description = "The public IP addresses of the EC2 instances created"
}
