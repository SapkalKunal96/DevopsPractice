terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " ~> 5.84.0"
    }
  }
}

provider "aws" {
  region = var.us_east_region
}

provider "aws" {
  alias  = "us_west"
  region = var.us_west_region
}