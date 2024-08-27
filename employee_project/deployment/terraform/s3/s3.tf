resource "aws_s3_bucket" "praneeth_bucket" {
  bucket = var.name
  tags = {
    Purpose    = "praneeth-devops-test-bucket"
    managed_by = var.managed_by
  }
}