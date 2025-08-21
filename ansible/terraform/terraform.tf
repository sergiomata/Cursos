module "terraform_state_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"

  bucket = "${var.project}-${terraform.workspace}-tfstate"
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = {
    Terraform = "true"
    Environment = terraform.workspace
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "${var.project}-${terraform.workspace}-tf-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Terraform = "true"
    Environment = terraform.workspace
  }
}

module "vpc" {
  source = "./modules/VPC"
  vpc_cidr = var.vpc_cidr
  subnets_cidr = var.subnets_cidr
  route_table_cidr = var.route_table_cidr
  ingress_ports_list = var.ingress_ports_list
  sg_ingress_cidr = var.sg_ingress_cidr
}

module "ec2_instance" {
  source = "./modules/EC2"
  ec2_specs = var.ec2_specs
  public_subnet_id = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
}

module "ec2_instances" {
  source = "./modules/EC2_INSTANCES"
  ec2_specs = var.ec2_specs
  public_subnet_id = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
  target_instances = var.target_instances
}