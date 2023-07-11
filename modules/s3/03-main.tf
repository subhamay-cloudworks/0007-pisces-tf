# modules/multi-region/main.tf

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #   configuration_aliases = [
      #     aws.root,
      #     aws.region_2,
      #     aws.region_3
      #   ]
    }
  }
}

### 1. Bucket 
resource "aws_s3_bucket" "pisces_s3_bucket" {
  bucket        = local.s3_bucket_name
  force_destroy = true

  tags = local.tags
}

### 2. Bucket Versioning 
resource "aws_s3_bucket_versioning" "pisces_s3_bucket_versioning" {
  bucket = aws_s3_bucket.pisces_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }

}
### 3. Bucket Permission 
resource "aws_s3_bucket_public_access_block" "pisces_s3_public_access_block" {
  bucket = aws_s3_bucket.pisces_s3_bucket.id

  # Block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

### 4. Bucket Server Side Encryption 
resource "aws_s3_bucket_server_side_encryption_configuration" "pisces_s3_bucket_sse" {
  bucket = aws_s3_bucket.pisces_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_alias
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  count = data.aws_caller_identity.current.account_id == var.destination_account_id ? 1 : 0

  bucket = aws_s3_bucket.pisces_s3_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}
