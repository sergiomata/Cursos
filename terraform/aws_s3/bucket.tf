provider "aws" {
  region  = "us-east-1" 
  profile = "development"  
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-tf-test-bucket-${random_string.sufijo.id}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "random_string" "sufijo" {
    length = 4
    special = false
    upper = false
    numeric = false
}
