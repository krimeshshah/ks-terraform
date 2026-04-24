# module "asg" {
#   count               = var.asg_enabled ? 1 : 0
#   source              = "../modules/auto-scaling-group/"
#   stage               = var.stage
#   vpc_zone_identifier = local.vpc_private_subnet_ids
#   asg_security_group  = [local.security_group_ks_id]
#   target_group_arns   = local.target_group_arns
# }