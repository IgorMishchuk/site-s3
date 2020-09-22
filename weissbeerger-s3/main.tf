terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.7.0"
    }
  }

  backend "s3" {
    bucket         = "weissbeerger-state-lock"
    key            = "state.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "weissbeerger-state-lock"
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}