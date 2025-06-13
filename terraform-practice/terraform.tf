# terraform aws plugin  

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# aws provider configuration
provider "aws" {
    region = "ap-south-1"
  
}