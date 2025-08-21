data "aws_key_pair" "terraform_key_pair" {
  key_name = var.key_name
}