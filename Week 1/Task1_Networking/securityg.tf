# Security Group for SSH and Web traffic
resource "aws_security_group" "nat_web" {
  # ... other configuration ...
  name = "vpc_web"
  vpc_id = aws_vpc.net_vpc.id

  tags = {
    Name = "VPC_WEB"
  }

  ingress {
    description = "Allow Port 443"
    protocol  = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    to_port   = 443
  }

  ingress {
    description = "Allow Port 80"
    protocol  = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    to_port   = 80
  }

  ingress {
    description = "Allow ICMP"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = -1
    protocol = "icmp"
    to_port = -1
  }


  egress {
    description = "Allow all IP and Ports Outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "vpc_sh" {
  name        = "vpc_ssh"
  description = "Dev VPC SSH"
  vpc_id = aws_vpc.net_vpc.id

  tags = {
    Name = "VPC_SSH"
  }

  ingress {
    description = "Allow Port 22"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port   = 22
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}