provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-060a84cbcb5c14844"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}