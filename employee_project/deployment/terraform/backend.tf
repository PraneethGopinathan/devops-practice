# Since S3 access not provided ignoring the state saving mechanism

# resource "aws_s3_bucket" "state-bucket" {
#   bucket = "praneeth-devops-test-terraform-state-backend"
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
#   bucket = aws_s3_bucket.state-bucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.state-bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# Since DynamoDB access not provided ignoring the state lock mechanism

# resource "aws_dynamodb_table" "state-lock" {
#   name         = "TERRAFORM-STATE-LOCK"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }