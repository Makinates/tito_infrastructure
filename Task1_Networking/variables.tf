# Create AWS region variable
variable "region" {
  description = "Region to create our Resources"
  type = string
  default = "us-east-1"
}

# Create EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "tito-key"
}