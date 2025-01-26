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
  source       = "../website/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css" {
  for_each     = fileset("../website/css", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "css/${each.value}"
  source       = "../website/css/${each.value}"
  content_type = "text/css"
}

resource "aws_s3_object" "img" {
  for_each     = fileset("../website/img", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "img/${each.value}"
  source       = "../website/img/${each.value}"
  content_type = "image/jpg"
}


resource "aws_s3_object" "js" {
  for_each     = fileset("../website/js", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "js/${each.value}"
  source       = "../website/js/${each.value}"
  content_type = "application/javascript"
}


resource "aws_s3_object" "video" {
  for_each     = fileset("../website/video", "*")
  bucket       = module.s3_bucket.s3_bucket_id
  key          = "video/${each.value}"
  source       = "../website/video/${each.value}"
  content_type = "video/mp4"
}



