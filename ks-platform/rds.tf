locals {
  rds_db_instance_resource_id = module.rds[0].fastpi_db_resource_id
}

module "rds" {
  source                 = "../modules/rds"
  count                  = var.create_rds ? 1 : 0
  stage                  = var.stage
  db_prefix              = var.db_prefix
  database_subnets       = local.database_subnets
  vpc_security_group_ids = local.vpc_security_group_ids
}