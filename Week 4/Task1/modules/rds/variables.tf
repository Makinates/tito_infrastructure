variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "password" {
  description = "The password for the database"
  type        = string
}

variable "parameter_group_name" {
  description = "The parameter group name"
  type        = string
  default     = null
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot before deletion"
  type        = bool
  default     = true
}

variable "subnet_ids" {
  type = list(string)
}