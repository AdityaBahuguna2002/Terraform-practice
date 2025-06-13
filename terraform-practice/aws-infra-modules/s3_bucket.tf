resource "aws_s3_bucket" "my-s3-bucket" {
    bucket = "${var.my-env}-my-terraform-s3-bucket-for-practice"
    tags = {
        Name = "${var.my-env}-my-terraform-s3-bucket-for-practice"
        environment = var.my-env # Adding an environment tag for better organization like dev, staging, or production
    }
}