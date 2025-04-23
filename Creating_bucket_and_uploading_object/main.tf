#terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.15"
    }
  }
}

provider "aws" {
  region = "us-east-2"

}

#Creating s3 bucket and uploading file in it.

resource "random_string" "unique_name" {
  length  = 4
  special = false
  upper   = false
  numeric = true

}

#creating bucket name
resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-aws-bucket-${random_string.unique_name.result}"


}

#uploading object in bucket
resource "aws_s3_object" "object_name" {
  bucket = aws_s3_bucket.example_bucket.bucket #name of the bucket where object should be upload
  key    = "text.txt"                          #name of the file
  source = "${path.module}/text.txt"           #path to the file

}

#giving public access
resource "aws_s3_bucket_public_access_block" "blocking" {
  bucket                  = aws_s3_bucket.example_bucket.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = true

}

#Enabled versioning
resource "aws_s3_bucket_versioning" "versioning_name" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = "Enabled"
  }

}

#creating bucket policy
resource "aws_s3_bucket_policy" "policy_name" {
  bucket = aws_s3_bucket.example_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = "${aws_s3_bucket.example_bucket.arn}/*"
      }
    ]
  })
}


data "aws_s3_bucket_policy" "policy_name" {
  bucket = aws_s3_bucket.example_bucket.id

  depends_on = [aws_s3_bucket_policy.policy_name]
}

#showing output on terminal
output "bucket11" {
  value = aws_s3_bucket.example_bucket.bucket
}
