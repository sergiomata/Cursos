terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=6.4.0, != 6.5.0, <= 6.7.0"
    }
  }
  required_version = "~>1.12.2"
}

provider "aws" {
    region  = "us-east-1" 
    profile = "development"  
}

provider "aws" {
    region  = "us-east-2" 
    profile = "development"
    alias  = "ohio"
}
