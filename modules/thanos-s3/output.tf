#output "thanos_s3_accesskey" {
#  value     = aws_iam_access_key.thanos.id
#  sensitive = true
#}

#output "thanos_s3_secretkey" {
#  value     = aws_iam_access_key.thanos.secret
#  sensitive = true
#}

output "thanos_s3_bucket" {
  value = aws_s3_bucket.thanos.bucket
}
