resource "aws_vpc" "vpc_us_east_1" {
  # This line is making difference between two region vpc's
  provider             = aws
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "us-east-1 VPC"
  }
}

resource "aws_subnet" "us_east_subnet" {
  count                   = length(var.public_subnet_east_zone)
  vpc_id                  = aws_vpc.vpc_us_east_1.id
  cidr_block              = element(var.public_subnet_east_cidr, count.index)
  availability_zone       = element(var.public_subnet_east_zone, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "us-east-subnet"
  }
}


resource "aws_internet_gateway" "us-east-ig" {
  vpc_id = aws_vpc.vpc_us_east_1.id

}


resource "aws_route_table" "us-east-rt" {
  vpc_id = aws_vpc.vpc_us_east_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us-east-ig.id

  }
}


resource "aws_route_table_association" "us-east-rt-assoc" {
  count          = length(var.public_subnet_east_zone)
  subnet_id      = element(aws_subnet.us_east_subnet[*].id, count.index)
  route_table_id = aws_route_table.us-east-rt.id
}



resource "aws_vpc" "vpc_us_west_2" {
  # This line is making difference between two region vpc's
  provider             = aws.us_west
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "us-west-2-VPC"
  }
}

resource "aws_subnet" "us_west_subnet" {
  provider          = aws.us_west
  count             = length(var.public_subnet_west_zone)
  vpc_id            = aws_vpc.vpc_us_west_2.id
  cidr_block        = element(var.public_subnet_west_cidr, count.index)
  availability_zone = element(var.public_subnet_west_zone, count.index)

  tags = {
    Name = "us-west-2-subnet"
  }
}


resource "aws_internet_gateway" "us-west-ig" {
  provider = aws.us_west
  vpc_id   = aws_vpc.vpc_us_west_2.id

}


resource "aws_route_table" "us-west-rt" {
  provider = aws.us_west
  vpc_id   = aws_vpc.vpc_us_west_2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us-west-ig.id

  }
}


resource "aws_route_table_association" "us-west-rt-assoc" {
  provider       = aws.us_west
  count          = length(var.public_subnet_west_zone)
  subnet_id      = element(aws_subnet.us_west_subnet[*].id, count.index)
  route_table_id = aws_route_table.us-west-rt.id
}


