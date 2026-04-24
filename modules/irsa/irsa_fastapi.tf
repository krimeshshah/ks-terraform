module "irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.28.0"

  role_name = "eks-rds-access"

  #  policies = {
  #     policy = aws_iam_policy.rds_connect.arn
  #  }

  role_policy_arns = {
    policy = var.role_policy_arns
  }

  oidc_providers = {
    main = {
      provider_arn               = var.provider_arn
      namespace_service_accounts = var.namespace_service_accounts
    }
  }
}