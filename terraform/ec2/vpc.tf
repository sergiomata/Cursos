resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.virginia_vpc_cidr
  # cidr_block       = lookup(var.virginia_vpc_cidr, terraform.workspace)
  instance_tenancy = "default"

  tags = {
    Name = "vpc_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet_virginia" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = var.subnets[0] 
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet_virginia" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = var.subnets[1]  
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_subnet_virginia-${local.sufix}"
  }
  depends_on = [ aws_subnet.public_subnet_virginia ]
}

resource "aws_internet_gateway" "igw_virginia" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw_virginia-${local.sufix}"
  }
}

resource "aws_route_table" "public_route_table_virginia" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_virginia.id
  }
  tags = {
    Name = "public_route_table_virginia-${local.sufix}"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet_virginia.id
  route_table_id = aws_route_table.public_route_table_virginia.id
} 

resource "aws_security_group" "ec2_security_group_virginia" {
  name        = "ec2_security_group_virginia-${local.sufix}"
  description = "Security group for EC2 instance in Virginia"
  vpc_id      = aws_vpc.vpc_virginia.id


  dynamic "ingress" {
    for_each = var.ingress_ports_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [ var.sg_ingress_cidr ]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name = "ec2_security_group_virginia-${local.sufix}"
  }
}