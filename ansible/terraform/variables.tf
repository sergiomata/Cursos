variable project {
  description = "Project name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets_cidr" {
  type        = list(string)
  description = "List of subnet CIDR blocks"
}

variable "route_table_cidr" {
  type        = string
  description = "CIDR block for the route table"
}

variable "ingress_ports_list" {
  description = "List of ingress ports to allow in the security group"
  type        = list(number)
}

variable "sg_ingress_cidr" {
  description = "CIDR block for the security group ingress"
  type        = string
}

variable "ec2_specs" {
  description = "Specifications for the EC2 instance"
  type        = map(string)
}

variable "target_instances" {
  description = "List of instance names"
  type        = list(string)
}

