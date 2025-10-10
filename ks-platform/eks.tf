module "eks" {
  source = "../modules/eks"

  count              = var.eks_enabled ? 1 : 0
  stage              = var.stage
  eks_vpc_id         = local.vpc_id
  eks_subnet_ids     = local.vpc_private_subnet_ids
  eks_cp_subnet_ids  = local.vpc_private_subnet_ids
  eks_instance_types = var.eks_instance_types
}