resource "aws_instance" "ec2_instances" {
  for_each = toset(var.target_instances)
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  key_name      = var.ec2_specs.key_name
  subnet_id     = var.public_subnet_id
  associate_public_ip_address = true
  security_groups = [var.security_group_id]
  tags = {
    Name = "ec2-${each.value}"
  }
}