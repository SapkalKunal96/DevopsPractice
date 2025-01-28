variable "us_east_region" {
  description = "AWS region for the us-east VPC"
  type        = string
  default     = "us-east-1"
}

variable "us_west_region" {
  description = "AWS region for the us-west VPC"
  type        = string
  default     = "us-west-2"
}


variable "public_subnet_east_cidr" {
  description = "Public subnet CIDR in the us-east VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}

variable "public_subnet_east_zone" {
  description = "subnet in different az's for the public subnet in the us-east VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]

}


variable "public_subnet_west_cidr" {
  description = "subnet in different az's for the public subnet in the us-west VPC"
  type        = list(string)
  default     = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]

}


variable "public_subnet_west_zone" {
  description = "subnet in different az's for the public subnet in the us-west VPC"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]

}