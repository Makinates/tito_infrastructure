# Create EC2 Instance
resource "aws_instance" "ec2_web" {

  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"
  key_name = var.instance_keypair
  subnet_id = aws_subnet.vpc_subnet_public.id
  vpc_security_group_ids = [ aws_security_group.ec2.id ]
  security_groups = [ aws_security_group.ec2.id ]
  
  tags = {
    Name = "EC2 Instance"
  }
}