resource "aws_instance" "my-terra-instance" {
    count = var.instance_count
    ami = var.ami_id
    instance_type = var.instance_type
    # security_groups = var.security_groups
    tags = {
      Name = "${var.my-env}-my-terraform-instance"
    }
}