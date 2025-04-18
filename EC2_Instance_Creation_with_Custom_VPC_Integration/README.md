This Terraform project provisions an Amazon EC2 instance within a custom Virtual Private Cloud (VPC) on AWS. It demonstrates infrastructure as code (IaC) principles using [HashiCorp Terraform](https://www.terraform.io/) and AWS as the cloud provider.

What This Project Does

- Creates a custom VPC with CIDR block
- Adds public subnet(s)
- Creates an Internet Gateway and attaches it to the VPC
- Sets up a route table for public subnet
- Launches an EC2 instance in the public subnet

Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/) configured (`aws configure`)
- AWS IAM user with sufficient permissions
- An existing key pair in your AWS account for SSH access

Preview the plan:
-terraform plan

Apply the configuration:
-terraform apply -auto-approve

Destroy the infrastructure (when no longer needed):
-terraform destroy -auto-approve


