// This file contains the configuration for an AWS EC2 instance and a VPC.
// first you need to create a private key and public key pair for SSH access.
// by running the command in dir ~/.ssh:
// # ssh-keygen 
// it creates a private key (terra-key) and a public key (terra-key.pub).
resource "aws_key_pair" "mykey" {
    key_name = "terra-key"
    public_key = file("/home/ubuntu/.ssh/terra-key.pub")
}

resource "aws_default_vpc" "default_vpc" {
  
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic"

    vpc_id = aws_default_vpc.default_vpc.id

    ingress = {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
    }
    tags = {
        Name = "allow_ssh"
    }
}

resource "ec2_instance" "my-vpc-instance" {
    key_name = aws_key_pair.mykey.key_name
    security_groups = [aws_security_group.allow_ssh.name]
    ami = var.aws-ec2-amazon-linux
    instance_type = "t2.micro"
    subnet_id = aws_default_vpc.default_vpc.default_subnet_id 
    tags = {
        Name = "my-vpc-instance"
    }
}
