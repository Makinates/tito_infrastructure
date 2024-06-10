# Create a VPC
resource "aws_vpc" "net_vpc" {
  cidr_block       = "10.0.0.0/16"

  enable_dns_hostnames = true
  #instance_tenancy = "default"


  tags = {
    Name = "Networking VPC"
  }
}


resource "aws_instance" "ec2vm" {
  ami           = data.aws_ami.amzlinux2.id
  vpc_security_group_ids = [
    aws_security_group.vpc_sh.id,
    aws_security_group.nat_web.id
  ]

    
    
  instance_type = var.instance_type
  

  user_data = file("${path.module}/app1.sh")

  subnet_id = aws_subnet.public_sub.id

  key_name = var.instance_keypair

  tags = {
    Name = "My EC2"
  }
}

