resource "aws_db_subnet_group" "db_sub" {
  subnet_ids = var.subnet_ids
  
  name = "main rds subnet"
}



resource "aws_db_instance" "data_house" {
  allocated_storage    = "20"
  engine               = var.engine
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  db_subnet_group_name = aws_db_subnet_group.db_sub.name

  tags = {
    Name = var.db_name
  }
}