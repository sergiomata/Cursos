
variable "ec2_specs" {
  description = "Specifications for the EC2 instance"
  type        = map(string)
}
variable "public_subnet_id" {
  description = "ID of the public subnet where EC2 instance will be deployed"
  type        = string
}
variable "security_group_id" {
  description = "ID of the security group for the EC2 instance"
  type        = string
}
variable "target_instances" {
  description = "List of instance names"
  type        = list(string)
}