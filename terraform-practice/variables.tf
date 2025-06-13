variable "dynamodb-table-name" {
    default = "terra-table"
    type = string
    description = "this is table name for dynamodb table"
}

variable "ami-id" {
    default = "ami-0b09627181c8d5778" # Amazon Linux 2 AMI in us-south-1
    type = string
    description = "value of the AMI ID to be used for the EC2 instance"  
}

variable "instance-type" {
    default = "t2.micro"
    type = string
    description = "value of the instance type to be used for the EC2 instance"  
}