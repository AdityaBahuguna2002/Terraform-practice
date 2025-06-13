
# ssh key pair for ec2 instance
resource "aws_key_pair" "terra-key" {
    key_name = "terra-key"
    public_key = file ("/home/aditya/Desktop/pipelines/terraform-practice/terra-key.pub")
  
}

# default vpc 
resource "aws_default_vpc" "default" {
  
}

# security group for ec2 instance
resource "aws_security_group" "terra-sg" {
    name = "terra-sg"
    description = "Allow SSH inbound traffic"
    vpc_id = aws_default_vpc.default.id # Reference to the default VPC --> this is called interpolation.

    # incoming traffic rules/ inbound rules
    ingress {
        description = "Allow SSH inbound traffic from anywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow SSH inbound traffic from anywhere"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow SSH inbound traffic from anywhere"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    # outgoing traffic rules/ outbound rules
    egress {
        description = "Allow all outbound traffic from the instance"
        from_port = 0
        to_port = 0
        protocol = "-1" # -1 means all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "terra-sg"
    }
}

# ec2 instance
resource "aws_instance" "terra-instance" {
    ami = var.ami-id # Amazon Linux 2 AMI 
    instance_type = var.instance-type # Instance type, e.g., t2.micro
    key_name = aws_key_pair.terra-key.key_name # Reference to the key pair created above
    security_groups = [ aws_security_group.terra-sg.name ] 
    tags = {
      Name = "terra-instance"
    }
}
