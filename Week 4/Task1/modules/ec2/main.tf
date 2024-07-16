
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  #subnet_id = element(var.subnet_ids, count.index)
  subnet_id = element(var.subnet_ids, 0)
  key_name = "server-key"

  tags = {
    Name = "Virtual Instance"
  }
}
