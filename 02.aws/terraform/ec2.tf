resource "aws_instance" "web" {
  ami           = "ami-0e1bed4f06a3b463d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.us_east_subnet[0].id
  key_name      = "devopseast"
  #   associate_public_ip_address = true
  tags = {
    Name = "us-east-1-instance"
  }
}

resource "aws_instance" "db" {
  provider                    = aws.us_west
  ami                         = "ami-00c257e12d6828491"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.us_west_subnet[0].id
  key_name                    = "devopswest"
  associate_public_ip_address = true
  tags = {
    Name = "us-west-2-instance"
  }
}