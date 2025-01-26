variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}


variable "bucket_name" {
  description = "The name of the S3 bucket"
  default     = "www.cloudenthusiastic.online"

}


variable "bucket_tags" {
  type = map(string)
  default = {
    Name        = "cloudenthusiastic.online"
    Environment = "PROD"
  }
}
