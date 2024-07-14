
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = element(var.subnet_ids, count.index)
  key_name = var.instance_key

  tags = {
    Name = "Virtual Instance"
  }
}
