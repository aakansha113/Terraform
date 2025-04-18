
terraform {
  required_version = "~> 1.7" #version of terraform
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50" #version of hashicorp
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0" #version of random provider

    }
  }
}

provider "aws" {
  region = "ap-south-1"

}

resource "random_id" "mybucket" {
  byte_length = 6

}


resource "aws_s3_bucket" "example_bucket" {
  bucket = "mybucket-${random_id.mybucket.hex}"

}

output "bucket" {
  value = aws_s3_bucket.example_bucket.bucket

}

