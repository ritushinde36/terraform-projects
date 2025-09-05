output "bucket_name" {
    description = "Name of the S3 bucket"
    value = module.s3-static-website.bucket_name
}

output "bucket_domain_name" {
    description = "Name of the S3 bucket"
    value = module.s3-static-website.bucket_domain_name
}

output "bucket_static_website_url" {
    description = "Static Website URL"
    value = module.s3-static-website.bucket_static_website_url
  
}