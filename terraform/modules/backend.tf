terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region  = "us-east-1"
    bucket  = "cerberus-dev-s3-us-east-1-dev-terraform-state-state"
    key     = "terraform.tfstate"
    profile = "development"
    encrypt = "true"

    dynamodb_table = "cerberus-dev-s3-us-east-1-dev-terraform-state-state-lock"
  }
}
