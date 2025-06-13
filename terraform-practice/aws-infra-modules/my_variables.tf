variable "my-env" {
    description = "Environment variables for AWS infrastructure modules"
    type = string     
}

variable "ami_id" {
    description = "value of the AMI ID to be used for the EC2 instance"
    type = string
}

variable "instance_type" {
    description = "value of the instance type to be used for the EC2 instance"
    type = string
}

variable "instance_count" {
    description = "Number of EC2 instances to be created"
    type = number
}

