output "bucket_name" {
    description = "Name of the S3 bucket"
    value = aws_s3_bucket.s3-bucket.id
}

output "bucket_domain_name" {
    description = "Name of the S3 bucket"
    value = aws_s3_bucket.s3-bucket.bucket_domain_name
}

output "bucket_static_website_url" {
    description = "Static Website URL"
    value = "http://${aws_s3_bucket.s3-bucket.bucket}.s3-website.${aws_s3_bucket.s3-bucket.region}.amazonaws.com"
  
}