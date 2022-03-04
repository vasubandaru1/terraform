resource "aws_instance" "sample" {
  ami           =  "ami-0b90346fbb8e13c09"
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.SGID]

  tags = {
    Name = "sample"
  }
}


variable "SGID" {}

output "public_ip" {
  value = aws_instance.sample.public_ip
}
