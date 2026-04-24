locals {
  vpc_id                 = module.networking[0].vpc_id
  vpc_private_subnets    = module.networking[0].vpc_private_subnets
  vpc_public_subnets     = module.networking[0].vpc_public_subnets
  database_subnets       = module.networking[0].vpc_private_subnets
  vpc_security_group_ids = module.networking[0].security_group_default_id
}
module "networking" {
  source = "../modules/networking"

  count = var.networking_enabled ? 1 : 0

  # General
  availability_zones  = var.availability_zones
  stage               = var.stage
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets
  vpc_enable_ipv6     = var.vpc_enable_ipv6
  vpc_cidr_block      = var.vpc_cidr_block

  enable_vpn_gateway = var.enable_vpn_gateway

  vpc_intra_subnets = var.vpc_intra_subnets

  region = var.region
  # legacy_names = var.legacy_names
  # create_sg    = var.create_sg
}