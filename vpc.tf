provider "aws" {
	region = "us-west-1"
}

# Create a VPC

resource "aws_vpc" "web-vpc" {
  cidr_block = var.web_vpc
 tags = {
    Name = "checkpoint iaas"
  }
}
# Creating public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.web-vpc.id
  cidr_block = var.public1
  availability_zone = "us-west-1b"
  tags = {
    Name = "checkpoint iaas"
  }
}

# Creating private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.web-vpc.id
  cidr_block = var.private1
  availability_zone = "us-west-1b"
  tags = {
    Name = "checkpoint iaas"
  }
}
# Creating internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id     = aws_vpc.web-vpc.id
  tags = {
    Name = "Checkpoint IAAS"
  }
}
# creating route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.web-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Checkpoint IAAS"
  }
}
# Associating public route table with the public subnet
resource "aws_route_table_association" "a1" {
 subnet_id = aws_subnet.public-subnet.id
 route_table_id = aws_route_table.public-route-table.id
}


