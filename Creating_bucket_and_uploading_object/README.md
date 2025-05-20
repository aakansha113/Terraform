# Terraform-Hashicorp-AWS: Creating S3 Bucket and Uploading Object

This project demonstrates how to use Terraform to provision an **Amazon S3 bucket** and upload an object (e.g., a text file) into the bucket.

## Files in This Repository

- **main.tf**  
  Contains the Terraform configuration for:
  - Creating an S3 bucket
  - Uploading a file (`text.txt`) to the bucket using `aws_s3_bucket_object`

- **text.txt**  
  The sample file that is uploaded to the S3 bucket.

- **myplan**  
  Binary file generated using `terraform plan -out=myplan`. It represents the execution plan.

- **terraform.tfstate** and **terraform.tfstate.backup**  
  Tracks the current state of infrastructure managed by Terraform.

- **.terraform.lock.hcl**  
  Lock file to ensure consistent provider versions.

- **.gitignore**  
  Specifies files/folders to be ignored by Git.

