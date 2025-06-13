resource "aws_dynamodb_table" "name" {
    name = var.dynamodb-table-name
    billing_mode = "PAY_PER_REQUEST" # On-demand billing mode
    hash_key = "id" 
    attribute {
      name = "id"
      type = "S" # String type for the hash key
    }
}