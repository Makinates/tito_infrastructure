provider "aws" {
  region = var.region
}

module "vpc" {
  source            = "../modules/vpc"
  region            = var.region 
  project_name      = var.project_name
  vpc_cidr          = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_db_subnet_1_cidr = var.private_db_subnet_1_cidr
  private_db_subnet_2_cidr = var.private_db_subnet_2_cidr
}

module "ec2" {
  source        = "../modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_ids     = element(module.vpc.subnet_ids, [0])
  instance_name = var.instance_name
  
}

module "rds" {
  source               = "../modules/rds"
  allocated_storage    = var.db_allocated_storage
  engine               = "mysql"
  #db_engine_version    = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "Titolu"
  username             = "admin"
  password             = "password123"
  parameter_group_name = var.db_parameter_group_name

  #vpc_id = module.vpc.vpc_id
  
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "rds_endpoint" {
  value = module.rds.db_instance_endpoint
}
