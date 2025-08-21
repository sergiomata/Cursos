output "ec2_public_ip" {
  value = aws_instance.ec2_instance_virginia.public_ip
  description = "value of the public IP address of the EC2 instance in Virginia"
}
