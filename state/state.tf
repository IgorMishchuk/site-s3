resource "aws_s3_bucket" "state_lock_bucket" {
  bucket = var.infra_bucket
  acl    = "private"

  tags = {
    Name = "State lock bucket"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "state_lock_ddb" {
  name           = var.infra_ddb
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "State lock DDB"
  }
}