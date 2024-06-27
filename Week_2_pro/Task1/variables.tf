variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "github_token" {
  description = "The GitHub token for accessing the repository"
  type        = string
}
