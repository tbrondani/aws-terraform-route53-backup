resource "aws_s3_bucket" "backup_bucket" {
  bucket = var.bucket_name

  force_destroy = true
  #  force_destroy = var.force_destroy
  # set to false after extensive tests

  tags = {
    Name        = var.bucket_name
    Environment = var.tag_environment
    Owner       = var.tag_owner
    Billing     = var.tag_billing
    Region      = var.region
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.backup_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encyption" {
  bucket = aws_s3_bucket.backup_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}