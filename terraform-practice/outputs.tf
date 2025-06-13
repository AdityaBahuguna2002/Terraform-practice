output "my-ec2-ip" {
    value =  aws_instance.terra-instance.public_ip
}