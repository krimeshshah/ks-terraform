module "iam_account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-account"
  version = "~> 5.0"

  account_alias                  = var.account_name
  create_account_password_policy = false
}