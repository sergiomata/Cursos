virginia_vpc_cidr = "10.10.0.0/16"
# virginia_vpc_cidr = {
#   "prod": "10.10.0.0/16",
#   "dev": "10.0.0.0/16"
# }
# public_subnet_cidr = "10.10.0.0/24"
# private_subnet_cidr = "10.10.1.0/24"
subnets = [ "10.10.0.0/24", "10.10.1.0/24" ]
tags = {
  "env" = "dev"
  "IAC" = "terraform",
  "project" = "cerberus"
}

key_name = "terraform"
sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  instance_type = "t2.micro"
  ami = "ami-08a6efd148b1f7504"
}
enable_monitoring = 0
ingress_ports_list = [22, 80, 443]