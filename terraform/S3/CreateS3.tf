terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.97.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "tf_bucket" {
  bucket = "my-tf-test-bucket-florita"

  tags = {
    Name        = "My Bucket with Terraform"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "tf_versioning" {
  bucket = aws_s3_bucket.tf_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}