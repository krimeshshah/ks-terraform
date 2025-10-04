#resource "local_sensitive_file" "local_secret_values_dt_aws" {
#  count    = var.create_local_files ? 1 : 0
#  content  = <<EOT
#secret:
#  objectstore:
#    accessKey: ${aws_iam_access_key.thanos.id}
#    secretKey: ${aws_iam_access_key.thanos.secret}
#    bucketName: ${aws_s3_bucket.s3.bucket}
#EOT
#  filename = "${path.cwd}/local/thanos-s3-${var.stage}-secret.yaml"
#}