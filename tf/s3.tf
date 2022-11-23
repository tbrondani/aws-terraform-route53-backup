resource "aws_s3_bucket" "backup_bucket" {
  bucket = "my-bucket-backup-test-amazing-solutions-2023-remaster-ultra-editorscut"
  
  
  force_destroy = true
  #set to false after extensive tests
  
  tags = {
    Name        = "${aws_s3_bucket.backup_bucket.name}"
    Environment = var.tag_environment
    Owner = var.tag_owner
    Billing = var.tag_billing
    Region = var.tag_region
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.backup_bucket.id
  acl    = "private"
}

