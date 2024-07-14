variable "ami" {}
variable "instance_type" {}
variable "instance_key" {}

variable "subnet_ids" {
  type = list(string)
}