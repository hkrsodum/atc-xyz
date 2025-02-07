resource "aws_vpc" "harikumar-vpc" {
  cidr_block           = "20.20.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "harikumar-vpc"
  }
}
resource "aws_subnet" "harikumar-subnet-1" {
  vpc_id                  = aws_vpc.harikumar-vpc.id
  cidr_block              = "20.20.10.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "harikumar-subnet-1"
  }
}
resource "aws_subnet" "harikumar-subnet-2" {
  vpc_id                  = aws_vpc.harikumar-vpc.id
  cidr_block              = "20.20.20.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "harikumar-subnet-2"
  }
}

resource "aws_subnet" "harikumar-subnet-3" {
  vpc_id                  = aws_vpc.harikumar-vpc.id
  cidr_block              = "20.20.30.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false
  tags = {
    Name = "harikumar-subnet-3"
  }
}
resource "aws_security_group" "harikumar-sg-inbound" {
  name   = "harikumar-sg"
  vpc_id = aws_vpc.harikumar-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "harikumar-sg-inbound"
  }
  depends_on = [aws_vpc.harikumar-vpc, aws_subnet.harikumar-subnet-1, aws_subnet.harikumar-subnet-2]
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.harikumar-vpc.id
  route_table_id = aws_route_table.harikumar-rt.id
}

resource "aws_internet_gateway" "harikumar-ig" {
  vpc_id = aws_vpc.harikumar-vpc.id
  tags = {
    Name = "harikumar-ig"
  }
}
resource "aws_route_table" "harikumar-rt" {
  vpc_id = aws_vpc.harikumar-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harikumar-ig.id
  }
  tags = {
    Name = "harikumar-rt"
  }
}
