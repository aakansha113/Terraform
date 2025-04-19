#Creating s3 bucket and uploading file in it.

resource "random_string" "unique_name" {
  length  = 4
  special = false
  upper   = false
  numeric  = true

}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-aws-bucket-${random_string.unique_name.result}"

}

resource "aws_s3_object" "object_name" {
  bucket = aws_s3_bucket.example_bucket.bucket #name of the bucket where object should be upload
  key    = "text.txt"                          #name of the file
  source = "${path.module}/text.txt"           #path to the file

}

