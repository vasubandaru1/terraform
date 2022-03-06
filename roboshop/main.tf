resource "aws_spot_instance_request" "cheap_worker" {
  count         = length(var.component)
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0fcfa1dc4218b8b12"]

  tags = {
    Name = element(var.component, count.index )

  }
}

data "aws_ami" "example" {
  most_recent = true
  name_regex  = "^Cent*"
  owners      = ["973714476881"]
}

variable "component" {
  default = [ "frontend", "mongodb", "catalogue", "cart", "user", "redis", "mysql", "shipping", "rabbitmq", "payment" ]
}