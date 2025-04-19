#terraform block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.15"
    }
  }
}

#provider block for instance1

provider "aws" {
  region = "us-east-2"

}