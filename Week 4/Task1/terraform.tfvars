region = "us-east-1"
vpc_name = "tech"
project_name = "techforest"
vpc_cidr = "10.0.0.0/16"
public_subnet_1_cidr = "10.0.0.0/24"
public_subnet_2_cidr = "10.0.1.0/24"
private_db_subnet_1_cidr = "10.0.2.0/24"
private_db_subnet_2_cidr = "10.0.3.0/24"

# EC2 Resources
ami = "ami-0b72821e2f351e396"
instance_type = "t3.micro"
#instance_key = 
instance_name = "techforest-EC2"
#subnet_ids = [ "public_subnet_1", "public_subnet_2" ]
subnet_ids = "public_subnet_1"

# RDS Resources
db_allocated_storage = 20
db_engine = "mysql"
db_instance_class = "db.t3.micro"
db_name = "techrds"
db_username = "Admin"
db_password = "password"
