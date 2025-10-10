output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_private_subnet_ids" {
  value = module.vpc.private_subnets
}


output "vpc_public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "security_group_ks_id" {
  value = module.security_group_ks.security_group_id
}

output "security_group_bastion_id" {
  value = module.security_group_bastion.security_group_id
}

output "security_group_default_id" {
  value = module.vpc.default_security_group_id
}


output "vpc_private_route_tables" {
  value = module.vpc.private_route_table_ids
}