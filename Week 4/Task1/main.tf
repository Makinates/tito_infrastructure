provider "aws" {
  region = var.region
}

module "vpc" {
  source            = "./modules/vpc"
  region            = "us-east-1" 
  project_name      = "techforest"
  vpc_cidr          = "10.0.0.0/16"
  
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_db_subnet_1_cidr = var.private_db_subnet_1_cidr
  private_db_subnet_2_cidr = var.private_db_subnet_2_cidr
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_ids    = module.vpc.subnet_ids
  #instance_name = var.instance_name
  #instance_key = ""
  
  
}

module "rds" {
  source               = "./modules/rds"
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  #db_engine_version    = "5.7"
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  #parameter_group_name = var.db_parameter_group_name

  #vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  
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
