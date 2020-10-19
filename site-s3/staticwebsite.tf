resource "aws_s3_bucket" "static_website" {
  bucket = "${var.index_bucket}-${var.suffix}"
  acl    = "public-read"

  website {
    index_document = var.index_doc
  }

  tags = {
    Name = "Static website for ${var.suffix} environment"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.static_website.id
  key          = var.index_doc
  source       = "assets/${var.index_doc}"
  acl          = "public-read"
  content_type = "text/html"

  tags = {
    Name = "Static index.html"
  }
}

resource "aws_s3_bucket_object" "css" {
  bucket       = aws_s3_bucket.static_website.id
  key          = "css/${var.css}"
  source       = "assets/css/${var.css}"
  acl          = "public-read"
  content_type = "text/css"

  tags = {
    Name = "Static style.css"
  }
}