terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.7.0"
    }
  }

  backend "s3" {
    bucket         = "weissbeerger-state-lock"
    key            = "state"
    region         = "eu-west-3"
    dynamodb_table = "weissbeerger-state-lock"
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_s3_bucket" "static_website" {
  bucket = var.index_bucket
  acl    = "public-read"

  website {
    index_document = var.index_doc
  }

  tags = {
    Name = "Weissbeerger static website"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = var.index_bucket
  key          = var.index_doc
  source       = "nginx/${var.index_doc}"
  acl          = "public-read"
  content_type = "text/html"

  depends_on = [
    aws_s3_bucket.static_website
  ]

  tags = {
    Name = "Weissbeerger static index.html"
  }
}

resource "aws_s3_bucket_object" "css" {
  bucket       = var.index_bucket
  key          = "css/${var.css}"
  source       = "nginx/css/${var.css}"
  acl          = "public-read"
  content_type = "text/css"

  depends_on = [
    aws_s3_bucket.static_website
  ]

  tags = {
    Name = "Weissbeerger static style.css"
  }
}