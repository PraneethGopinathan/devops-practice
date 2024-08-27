terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
  #  backend "s3" {
  #    bucket         = "praneeth-devops-test-terraform-state-backend"
  # #    key            = "terraform/terraform.tfstate"
  #    region         = "eu-west-1"
  # #    profile        = "terraform" # Use your corresponding profile
  # #    dynamodb_table = "TERRAFORM-STATE-LOCK"
  # #    encrypt        = true
  #  }
}

provider "aws" {
  region  = var.region
  profile = "praneeth-test"
}

