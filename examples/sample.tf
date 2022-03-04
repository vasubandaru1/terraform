provider "aws" {
   region  =  "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "vasudevops"
    key    = "example/devops/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ec2" {
  count  = 2
  source = "./ec2"
  SGID = module.sg.SGID
}

module "sg" {
  source = "./sg"
}


