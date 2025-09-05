resource "aws_s3_bucket" "s3-bucket" {
    bucket = var.s3_bucket_name
    tags = var.s3_bucket_tags
    force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "s3-bucket-website-configuration" {
    bucket = aws_s3_bucket.s3-bucket.id
    index_document {
      suffix = "index.html"
    }
}

resource "aws_s3_bucket_versioning" "s3-bucket-website-versioning" {
    bucket = aws_s3_bucket.s3-bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_ownership_controls" "s3-bucket-website-ownership" {
  bucket = aws_s3_bucket.s3-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3-bucket-website-acls" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3-bucket-website-ownership,
    aws_s3_bucket_public_access_block.s3-bucket-website-public-access
  ]
  bucket = aws_s3_bucket.s3-bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "s3-bucket-website-public-access" {
    bucket = aws_s3_bucket.s3-bucket.id

    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3-bucket-website-policy" {
    bucket = aws_s3_bucket.s3-bucket.id

    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.s3_bucket_name}/*"
          ]
      }
  ]
}  
EOF
  
}

resource "aws_s3_object" "s3-bucket-website-index-file" {
  bucket = aws_s3_bucket.s3-bucket.id
  key    = "index.html"
  source = var.s3_index_path
  content_type = "text/html"
}