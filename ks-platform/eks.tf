locals {
  oidc_provider_arn = module.eks[0].oidc_provider_arn
}

module "eks" {
  source = "../modules/eks"

  count              = var.eks_enabled ? 1 : 0
  stage              = var.stage
  eks_vpc_id         = local.vpc_id
  eks_subnet_ids     = local.vpc_private_subnets
  eks_cp_subnet_ids  = local.vpc_public_subnets
  eks_instance_types = var.eks_instance_types
}