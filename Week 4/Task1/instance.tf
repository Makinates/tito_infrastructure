# Create EC2 Instance
resource "aws_instance" "ec2_web" {
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.vpc_subnet.id
  security_groups = [ aws_security_group.vpc_sec.id ]

  tags = {
    Name = "EC2 Instance"
  }
}