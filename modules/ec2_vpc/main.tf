
resource "aws_s3_bucket" "state_bucket" {
  bucket = var.bucket_name
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "lock_table" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_ebs_volume" "data" {
  availability_zone = var.az
  size              = var.size
  tags = { Name = "app-ebs" }
}
