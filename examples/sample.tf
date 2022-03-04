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


