variable "virginia_vpc_cidr" {
    description = "CIDR block for the Virginia VPC"
    type = string
    sensitive = false
}

# variable "public_subnet_cidr" {
#     description = "CIDR block for the public subnet in Virginia"
#     type = string
#     sensitive = false
# }

# variable "private_subnet_cidr" {
#     description = "CIDR block for the private subnet in Virginia"
#     type = string
#     sensitive = false
# }

variable "subnets" {
    type = list(string)
    description = "List of subnet CIDR blocks"
}
variable "tags" {
    type = map(string)
    description = "Tags to apply to resources"
}


variable "key_name" {
    description = "Name of the existing key pair to use for the EC2 instance"
    type = string
    sensitive = false
}

variable sg_ingress_cidr {
    description = "CIDR block for ingress rules in the security group"
    type = string
}

variable ec2_specs {
    description = "Specifications for the EC2 instance"
    type = map(string)
}
variable "enable_monitoring" {
    description = "Flag to enable or disable the monitoring instance"
    type = number
}

variable "ingress_ports_list" {
    description = "List of ingress ports to allow in the security group"
    type = list(number)
}