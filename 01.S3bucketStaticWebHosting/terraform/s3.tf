locals {
  policy_document = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${var.bucket_name}/*",
      },
    ],
  })
}


module "s3_bucket" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  bucket                  = var.bucket_name
  force_destroy           = true
  attach_policy           = true
  policy                  = local.policy_document
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  versioning = {
    enabled = true
  }
  website = {
    index_document = "index.html"
  }
  tags = var.bucket_tags
}

resource "aws_s3_object" "index_html" {
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "index.html"
  source       = "/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css" {
  for_each     = fileset("/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/css", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "css/${each.value}"
  source       = "/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/css/${each.value}"
  content_type = "text/css"
}

resource "aws_s3_object" "img" {
  for_each     = fileset("/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/img", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "img/${each.value}"
  source       = "/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/img/${each.value}"
  content_type = "image/jpg"
}


resource "aws_s3_object" "js" {
  for_each     = fileset("/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/js", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "js/${each.value}"
  source       = "/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/js/${each.value}"
  content_type = "application/javascript"
}


resource "aws_s3_object" "video" {
  for_each     = fileset("/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/video", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "video/${each.value}"
  source       = "/home/kunal/upload_to_git_only/working_dir/03.staticWebsiteHosting/website/video/${each.value}"
  content_type = "video/mp4"
}



