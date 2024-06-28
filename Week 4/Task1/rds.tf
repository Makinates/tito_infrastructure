# Create Relational Database
resource "aws_db_instance" "my_rds" {

  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  vpc_security_group_ids = [ aws_security_group.rds.id ]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.id
  
  
}

resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds-subnet-group"
  description = "DB subnet group"
  subnet_ids = [ aws_subnet.vpc_subnet_private.id, aws_subnet.vpc_subnet_public.id ]
  
  

  tags = {
    Name = "rds-subnet-group"
  }
}

