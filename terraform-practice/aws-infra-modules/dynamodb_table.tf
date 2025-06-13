resource "aws_dynamodb_table" "my-dynamodb-table" {
    name = "${var.my-env}-my-terraform-dynamodb"
    billing_mode = "PAY_PER_REQUEST" # On-demand billing mode
    hash_key = "id"
    attribute {
        name = "id"
        type = "S" # String type for the hash key
    }
}