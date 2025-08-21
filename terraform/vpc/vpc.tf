resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.virginia_vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc_virginia"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block       = var.ohio_vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc_ohio"
  }
  provider = aws.ohio
}