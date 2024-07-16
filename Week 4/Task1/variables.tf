variable "region" {
  description = "The AWS region"
  type        = string
}


variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes for the RDS instance"
  type        = number
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  
}

variable "db_parameter_group_name" {
  description = "The parameter group name"
  type        = string
  default     = null
}


variable "project_name" {}

variable "vpc_cidr" {type        = string}

variable "public_subnet_1_cidr" {type        = string}

variable "public_subnet_2_cidr" {type        = string}

variable "private_db_subnet_1_cidr" {type        = string}

variable "private_db_subnet_2_cidr" {type        = string}
variable "subnet_ids" {
  type = string
  default = ""
}

#variable "instance_key" {}


