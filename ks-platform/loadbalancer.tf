# locals {
#   target_group_arns = module.loadbalancer[0].aws_lb_target_group_arns
# }

module "loadbalancer" {
  source                   = "../modules/loadbalancer"
  count                    = var.loadbalancer_enabled ? 1 : 0
  lb_vpc_id                = local.vpc_id
  lb_vpc_public_subnet_ids = local.vpc_public_subnets
  stage                    = var.stage
}