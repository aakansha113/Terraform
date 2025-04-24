terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "my-number-bucket-11"
    key    = "temp1/state.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}