resource "aws_iam_user" "lb-s3" {
  name = "lb-s3-${var.stage}"
  path = "/lb-s3/"
}


resource "aws_iam_access_key" "lb-s3" {
  user = aws_iam_user.lb.name
}


resource "aws_s3_bucket" "lb" {
  provider = aws
  bucket   = "lb-access-logs-${var.stage}"
  # acl      = "private"

  # versioning {
  #   enabled = false
  # }

  tags = {
    Cluster = var.stage
    Name    = "Blob storage for for Thanos Prometheus storage"
  }
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Deny",
          "Principal": "*",
          "Action": "s3:*",
          "Resource": [
              "arn:aws:s3:::${aws_s3_bucket.lb.bucket}",
              "arn:aws:s3:::${aws_s3_bucket.lb.bucket}/*"
          ],
          "Condition": {
              "Bool": {
                  "aws:SecureTransport": "false"
              },
              "NumericLessThan": {
                  "s3:TlsVersion": "1.2"
              }
          }
      }
  ]
}
  POLICY
}

resource "aws_s3_bucket_versioning" "lb-s3-versioning" {
  bucket = aws_s3_bucket.lb.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "lb-s3-ownership-control" {
  bucket = aws_s3_bucket.lb.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "lb-s3-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.lb-s3-ownership-control]

  bucket = aws_s3_bucket.lb.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "lb-sse-configuration" {
  bucket = "lb-${var.stage}"
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_lifecycle_configuration" "expire-versions-rule" {
  bucket = aws_s3_bucket.lb.id

  rule {
    id = "expire-versions-1"

    filter {}

    noncurrent_version_expiration {
      noncurrent_days = 1
    }

    status = "Enabled"
  }
}

resource "aws_iam_user_policy" "lb" {
  name = "lb-s3-access-log"
  user = aws_iam_user.lb-s3.name

  depends_on = [aws_s3_bucket.lb]

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1654779180601",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.lb.bucket}"
    },
    {
      "Sid": "Stmt1654779192011",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.lb.bucket}/*"
    }
  ]
}
EOF
}


resource "aws_s3_bucket_public_access_block" "lb" {
  bucket = aws_s3_bucket.lb.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#resource "local_sensitive_file" "local_secret_s3_thanos" {
#  count    = var.create_local_files ? 1 : 0
#  content  = <<EOT
#apiVersion: v1
#kind: Secret
#metadata:
#  name: thanos-objstore-config
#  namespace: monitoring
#type: Opaque
#stringData:
#  objstore.yml: |
#    type: s3
#    config:
#      bucket: ${aws_s3_bucket.thanos.bucket}
#      region: ${aws_s3_bucket.thanos.region}
#      endpoint: s3.amazonaws.com
#      access_key: ${aws_iam_access_key.thanos.id}
#      secret_key: ${aws_iam_access_key.thanos.secret}
#      insecure: false
#EOT
#  filename = "${path.cwd}/local/thanos-s3-secret.yaml"
#}
