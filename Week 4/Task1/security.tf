# Create Subnets
resource "aws_subnet" "vpc_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "vpc_subnet"
  }
}

# Create Internet Gateway for the VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc_IGW"
  }
}
# Create Route Table
resource "aws_route_table" "vpc_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Create Route Table Association
resource "aws_route_table_association" "route_asso" {
  subnet_id      = aws_subnet.vpc_subnet.id
  route_table_id = aws_route_table.vpc_route.id
}

# Create Security Group for the VPC
resource "aws_security_group" "vpc_sec" {
  vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "vpc_sec_ingress" {
  security_group_id = aws_security_group.vpc_sec.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "vpc_sec_egress" {
  security_group_id = aws_security_group.vpc_sec.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}