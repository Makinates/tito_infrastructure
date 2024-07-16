output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}



output "internet_gateway" {
  value = aws_internet_gateway.gw
}

output "subnet_ids" {
  value = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id,
           aws_subnet.private_db_subnet_1.id, aws_subnet.private_db_subnet_2.id
  ]
}

output "private_subnet_ids" {
  value = []
}