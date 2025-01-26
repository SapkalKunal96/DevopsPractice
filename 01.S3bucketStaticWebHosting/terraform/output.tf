output "bucket_url" {
  value = "http://${module.s3_bucket.s3_bucket_website_endpoint}"

}