// S3 buckets for weather forecast

resource "aws_s3_bucket" "berlin-weather" {
  bucket = "crazy-berlin-weather-hourly"
  acl    = "private"

  versioning {
    enabled = true
  }

  // define lifecycle rule 
  lifecycle_rule {
    id      = "weather-data"
    enabled = true
    expiration {
      days = 30
    }
  }

 //define SSE
 server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

}

resource "aws_s3_bucket" "berlin-weather" {
  bucket = "crazy-berlin-weather-daily"
  acl    = "private"

versioning {
    enabled = true
  }

// define lifecycle rule 
  lifecycle_rule {
    id      = "weather-data-1"
    enabled = true
    expiration {
      days = 30
    }
  }

}

resource "aws_s3_bucket" "berlin-weather" {
  bucket = "crazy-berlin-weather-weekly"
  acl    = "private"

versioning {
    enabled = true
  }

// define lifecycle rule 
  lifecycle_rule {
    id      = "weather-data-2"
    enabled = true
    expiration {
      days = 30
    }
  }

}

