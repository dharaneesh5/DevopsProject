resource "aws_s3_bucket" "webbucket" {
  bucket = "my-dharani-bucket-2005"
}

resource "aws_s3_bucket_ownership_controls" "webbucket" {
  bucket = aws_s3_bucket.webbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "webbucket" {
  bucket = aws_s3_bucket.webbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "webbucket" {
  bucket = aws_s3_bucket.webbucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement : [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.webbucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "webbucket" {
  bucket = aws_s3_bucket.webbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_policy.webbucket]
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.webbucket.id
  key          = "index.html"
  source       = "website/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.webbucket.id
  key          = "error.html"
  source       = "website/error.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css" {
  bucket       = aws_s3_bucket.webbucket.id
  key          = "style.css"
  source       = "website/style.css"
  content_type = "text/css"
}

resource "aws_s3_object" "javascript" {
  bucket       = aws_s3_bucket.webbucket.id
  key          = "script.js"
  source       = "website/script.js"
  content_type = "application/javascript"
}
