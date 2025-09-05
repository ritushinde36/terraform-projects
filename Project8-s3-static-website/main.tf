module "s3-static-website" {
    source = "./modules/s3-static-website"
    s3_bucket_name = var.s3_bucket_name
    s3_bucket_tags = {
        Name = var.s3_bucket_name
    }
    s3_index_path = "${path.module}/index_file/index.html"
}