# Create VPC
resource "aws_vpc" "main" {
  cidr_block            = var.vpc_cidr
  enable_dns_hostnames  = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Use data source to get all availability zones in the region
data "aws_availability_zones" "available_zones" {
  
}

# Create Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags                    = {
    Name                  = "public subnet az1"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags                    = {
    Name                  = "public subnet az2"
  }
}

# Create Internet Gateway and attach to the VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
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

# Create Public Subnet Route Table Association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "route_asso_public" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route.id
}

# Create Private Database Subnet
resource "aws_subnet" "private_db_subnet_1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_db_subnet_1_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "Private DB Subnet 1"
  }
}

resource "aws_subnet" "private_db_subnet_2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_db_subnet_2_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "Private DB Subnet 2"
  }
}

/*

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

*/