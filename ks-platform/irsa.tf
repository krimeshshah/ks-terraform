module "irsa" {
  source                     = "../modules/irsa"
  namespace_service_accounts = var.namespace_service_accounts
  role_policy_arns           = local.aws_iam_policy_arn
  provider_arn               = local.oidc_provider_arn
  # namespace = var.namespace
  # service_account = var.service_account
}