project="ansible"
vpc_cidr = "10.20.0.0/16"
subnets_cidr = ["10.20.1.0/24", "10.20.2.0/24"]
route_table_cidr = "0.0.0.0/0"
ingress_ports_list = [22, 80, 443]
sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  instance_type = "t2.micro"
  ami = "ami-08a6efd148b1f7504"
  key_name = "terraform"
}
target_instances = ["ec2_instance_web01", "ec2_instance_web02", "ec2_instance_db01"]