output "website_endpoint" {
  value = "http://${aws_s3_bucket.static_website.website_endpoint}/index.html"
}