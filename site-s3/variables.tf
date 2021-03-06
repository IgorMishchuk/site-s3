variable "region" {
  default = "eu-west-3"
}

variable "index_bucket" {
  default = "site-s3"
}

variable "index_doc" {
  default = "index.html"
}

variable "css" {
  default = "style.css"
}

variable "suffix" {
  description = "Environment suffix"
}