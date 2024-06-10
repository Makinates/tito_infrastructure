# Create a VPC
resource "aws_vpc" "net_vpc" {
  cidr_block       = "10.0.0.0/16"

  enable_dns_hostnames = true
  #instance_tenancy = "default"


  tags = {
    Name = "Networking VPC"
  }
}


# Create Public Subnets
resource "aws_subnet" "public_sub" {
  vpc_id     = aws_vpc.net_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  

  tags = {
    Name = "Public_subnet"
  }
}

/*
resource "aws_subnet" "private_sub" {
  vpc_id     = aws_vpc.net_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private_subnet"
  }
}
*/

# Create an IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.net_vpc.id

  tags = {
    Name = "vpc-igw"
  }
}

# Create Route Table
resource "aws_route_table" "nat_route_public" {
  vpc_id = aws_vpc.net_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "nat_public" {
  subnet_id      = aws_subnet.public_sub.id
  route_table_id = aws_route_table.nat_route_public.id
}
