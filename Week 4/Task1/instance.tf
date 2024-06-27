# Create EC2 Instance
resource "aws_instance" "ec2_web" {
  ami           = ""
  instance_type = "t3.micro"
  subnet_id = aws_subnet.vpc_subnet.id
  security_groups = [ aws_security_group.vpc_sec.id ]

  tags = {
    Name = "EC2 Instance"
  }
}