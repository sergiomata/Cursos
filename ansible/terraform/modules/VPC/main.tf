resource "aws_vpc" "vpc_ansible" {
  cidr_block       = var.vpc_cidr
  # cidr_block       = lookup(var.virginia_vpc_cidr, terraform.workspace)
  instance_tenancy = "default"

  tags = {
    Name = "vpc_ansible_${terraform.workspace}"
  }
}

resource "aws_subnet" "public_subnet_ansible" {
  vpc_id            = aws_vpc.vpc_ansible.id
  cidr_block        = var.subnets_cidr[0]
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_ansible_public"
  }
}
resource "aws_subnet" "private_subnet_ansible" {
  vpc_id            = aws_vpc.vpc_ansible.id
  cidr_block        = var.subnets_cidr[1]
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_ansible_private"
  }
}

resource "aws_internet_gateway" "igw_ansible" {
  vpc_id = aws_vpc.vpc_ansible.id

  tags = {
    Name = "igw_ansible"
  }
}

resource "aws_route_table" "public_route_table_ansible" {
  vpc_id = aws_vpc.vpc_ansible.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.igw_ansible.id
  }
  tags = {
    Name = "public_route_table_ansible"
  }
}

resource "aws_route_table_association" "public_subnet_association_ansible" {
  subnet_id      = aws_subnet.public_subnet_ansible.id
  route_table_id = aws_route_table.public_route_table_ansible.id
}

resource "aws_security_group" "ansible_sg" {
  name        = "ansible_sg"
  description = "Security group for Ansible managed instances"
  vpc_id      = aws_vpc.vpc_ansible.id

  dynamic "ingress" {
    for_each = var.ingress_ports_list
    content {
    from_port   = ingress.value
    to_port     = ingress.value
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
    }
  }

  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.sg_ingress_cidr]
  }
  tags = {
    Name = "ansible_sg"
  }
}
