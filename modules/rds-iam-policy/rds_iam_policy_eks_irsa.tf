data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "rds_connect" {
  name = "rds-iam-auth"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "rds-db:connect"
        Resource = "arn:aws:rds-db:${var.region}:${data.aws_caller_identity.current.account_id}:dbuser:${var.rds_db_instance_resource_id}/fastapi"
      }
    ]
  })
}
