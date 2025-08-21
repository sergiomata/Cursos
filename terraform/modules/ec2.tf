# variable "instances" {
#   description = "List of instance names"
#   type        = list(string)
#   default = ["apache"]
# }

# resource "aws_instance" "ec2_instance_virginia" {
#   # for_each = toset(var.instances)
#   ami           = var.ec2_specs.ami
#   instance_type = var.ec2_specs.instance_type
#   subnet_id     = aws_subnet.public_subnet_virginia.id
#   key_name      = data.aws_key_pair.terraform_key_pair.key_name
#   vpc_security_group_ids = [ aws_security_group.ec2_security_group_virginia.id ] 
#   user_data = file("scripts/userdata.sh")

#   tags = {
#     # Name = "${each.value}-${local.sufix}"
#     Name = "ec2_instance_virginia-${local.sufix}"
#   }
# }

# resource "aws_instance" "monitoring_instance" {
#     count = var.enable_monitoring == 1? 1 : 0
#   ami           = var.ec2_specs.ami
#   instance_type = var.ec2_specs.instance_type
#   subnet_id     = aws_subnet.public_subnet_virginia.id
#   key_name      = data.aws_key_pair.terraform_key_pair.key_name
#   vpc_security_group_ids = [ aws_security_group.ec2_security_group_virginia.id ] 
#   user_data = file("scripts/userdata.sh")

#   tags = {
#     Name = "monitoring_instance-${local.sufix}"
#   }
# }


    # provisioner "local-exec" {
    #     command = "echo 'EC2 instance created with public IP: ${aws_instance.ec2_instance_virginia.public_ip}' >> instance_data.txt"
    # }

    # provisioner "local-exec" {
    #     command = "echo 'EC2 instance deleted: ${self.public_ip}' >> instance_data.txt"
    # }

    # provisioner "remote-exec" {
    #     inline = [
    #         "echo 'Hello from the EC2 instance!' > ~/hello.txt",
    #         "cat ~/hello.txt"
    #     ]

    #     connection {
    #         type        = "ssh"
    #         user        = "ec2-user"
    #         private_key = file("~/.ssh/terraform.pem")
    #         host        = self.public_ip
    #     }
    # }

  #lifecycle {
    # create_before_destroy = true
    # prevent_destroy = true
    # ignore_changes = [
    #   ami,  # Ignore changes to the AMI ID
    #   instance_type,  # Ignore changes to the instance type
    # ]
    # replace_triggered_by = [ aws_subnet.public_subnet_virginia.id ]
  #}
