# Create Subnets
resource "aws_subnet" "vpc_subnet_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "vpc_subnet_public"
  }
}
resource "aws_subnet" "vpc_subnet_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.100.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "vpc_subnet_private"
  }
}

# Create Internet Gateway for the VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc_IGW"
  }
}
# Create Public Route Table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Create Public Route Table Association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.vpc_subnet_public.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "route_asso_public" {
  subnet_id      = aws_subnet.vpc_subnet_public.id
  route_table_id = aws_route_table.public_route.id
}

# Create Private Route Table
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
}
# Create Private Route Table Association
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.vpc_subnet_private.id
  route_table_id = aws_route_table.private_route.id
}
resource "aws_route_table_association" "route_asso_private" {
  subnet_id      = aws_subnet.vpc_subnet_private.id
  route_table_id = aws_route_table.private_route.id
}

# Create Security Group for EC2
resource "aws_security_group" "ec2" {
    name = "Web-security"
    description = "Security group for web servers"
    vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow SSH from my computer"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow all traffic through HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-security-group"
  }
}

resource "aws_security_group" "rds" {
  vpc_id = aws_vpc.main.id
  name = "rds_security"
  description = "Security group for databases"

  ingress {
    description = "Allow traffic from only the web security group"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  tags = {
    Name = "rds-security-group"
  }
}