terraform {
    required_version = "~> 1.8"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"

    }
    
  }
}

provider "aws" {
  region = var.region
}

# Credentials are configured on PC terminal