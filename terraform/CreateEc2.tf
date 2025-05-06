terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-060a84cbcb5c14844"
  instance_type = "t2.micro"

  key_name = "tf_key"

  vpc_security_group_ids = [aws_security_group.allow_tf.id]

  tags = {
    Name = "ExampleInstance"
  }
}

resource "aws_security_group" "allow_tf" {
  name        = "allow_tf"
  description = "Allow Terraform inbound traffic"
  vpc_id = "vpc-06c268d735a41dec2"

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tf"
  }
}

resource "aws_key_pair" "tf_key" {
  key_name   = "tf_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}

resource "local_file" "tf_local_key" {
  content = tls_private_key.rsa.private_key_pem
  filename = "tf_key"
}