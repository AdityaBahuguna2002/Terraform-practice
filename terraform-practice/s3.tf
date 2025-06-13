
resource "aws_s3_bucket" "my-bucket" {
    bucket = "s3-bucket-for-practice-from-terraform"
    tags = {
        Name = "s3-bucket-for-practice-from-terraform"
    }  
}