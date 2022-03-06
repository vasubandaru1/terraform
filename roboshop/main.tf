resource "aws_spot_instance_request" "cheap_worker" {
  count         = length(var.components)
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0fcfa1dc4218b8b12"]

  tags = {
    Name = element(var.components, count.index)

  }
}

data "aws_ami" "example" {
  most_recent = true
  name_regex  = "^Centos"
  owners      = ["973714476881"]
}

variable "components" {
  default = [ "frontend", "mongodb", "catalogue", "cart", "user", "redis", "mysql", "shipping", "rabbitmq", "payment" ]
}

provider "aws" {
  region = "us-east-1"
}