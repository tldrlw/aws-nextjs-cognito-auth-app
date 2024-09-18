terraform {
  backend "s3" {
    bucket         = "tfstate-aws-nextjs-cognito-auth-app"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-aws-nextjs-cognito-auth-app"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40.0"
    }
  }
  required_version = ">= 1.7.4"
}

provider "aws" {
  region = var.REGION
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Repo      = "https://github.com/tldrlw/aws-nextjs-cognito-auth-app/tree/dev"
    }
  }
}
