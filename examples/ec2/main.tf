resource "aws_instance" "sample" {
  count                  = var.env == "prod" ? 1 : 0
  ami                    = data.aws_ami.example.id
  instance_type          = var.instance_type == "" ? "t3.micro" : var.instance_type
  vpc_security_group_ids = [var.SGID]

  tags = {
    Name = element(var.name, count.index)
  }
}
resource "null_resource" "sample" {
  triggers = {
    abc = aws_instance.sample.*.private_ip[0]
  }
  provisioner "remote-exec" {
    connection {
      host = "self.public_ip"
      user = "Centos"
      password = "DevOps321"
    }
    inline = [
            "echo hello"
    ]
  }


}



variable "SGID" {}
variable "name" {}
variable "instance_type" {}
variable "env" {}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "^Centos*"
  owners           = ["973714476881"]


}

#locals {
#  NAME = element(var.name, count.index)
#}
#  local.NAME