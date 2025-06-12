provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "aws-s3-bucket-demo" {
    bucket = "my-s3-bucket-by-terraform-aws"  
}

resource "aws_instance" "demo-ce2"{

    ami = var.aws-ec2-ubuntu-instance
    instance_type = "t2.micro"
    tags = {
        Name = "ec2-instance-by-terraform"
    }
}