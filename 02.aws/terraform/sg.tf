locals {
  total_cidrs = concat(var.public_subnet_east_cidr, var.public_subnet_west_cidr, var.ssh-all)
}

resource "aws_security_group" "east-sg" {
  name        = "us-east-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_us_east_1.id

  tags = {
    Name = "us-east-1"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "east-rules" {
  count             = length(var.ports)
  type              = "ingress"
  from_port         = element(var.ports, count.index)
  to_port           = element(var.ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = [for cidr in local.total_cidrs : cidr]
  security_group_id = aws_security_group.east-sg.id
  description       = "All ports allowed by security team"
}

# resource "aws_vpc_security_group_ingress_rule" "east-ssh-port-allow" {
#   security_group_id = aws_security_group.east-sg.id

#   cidr_ipv4   = "0.0.0.0/0"
#   from_port   = 22
#   ip_protocol = "tcp"
#   to_port     = 22
# }

# resource "aws_vpc_security_group_egress_rule" "east-allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.east-sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }


resource "aws_security_group" "west-sg" {
  provider    = aws.us_west
  name        = "us-west-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_us_west_2.id

  tags = {
    Name = "us-west-a"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group_rule" "west-rules" {
  provider          = aws.us_west
  count             = length(var.ports)
  type              = "ingress"
  from_port         = element(var.ports, count.index)
  to_port           = element(var.ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = [for cidr in local.total_cidrs : cidr]
  security_group_id = aws_security_group.west-sg.id
  description       = "All ports allowed by security team"
}


# resource "aws_vpc_security_group_ingress_rule" "west-ssh-port-allow" {
#   provider          = aws.us_west
#   security_group_id = aws_security_group.west-sg.id

#   cidr_ipv4   = "0.0.0.0/0"
#   from_port   = 22
#   ip_protocol = "tcp"
#   to_port     = 22
# }

# resource "aws_vpc_security_group_egress_rule" "west-allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.west-sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }