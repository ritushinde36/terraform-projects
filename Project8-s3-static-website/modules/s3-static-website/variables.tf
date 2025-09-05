variable "s3_bucket_name" {
    description = "Name of the s3 bucket"
    type = string
}

variable "s3_bucket_tags" {
    description = "Tags attached to the S3 bucket"
    type = map(string)
}

variable "s3_index_path" {
    description = "Path of the index file for the website"
    type = string
}



