# # Gardener VPC
# module "security_group_gardener" {
#   source = "terraform-aws-modules/security-group/aws"

#   create      = var.create_sg
#   name        = var.legacy_names ? "gardener-security-group" : "${var.stage}-ks-sg"
#   description = "Security group for Gardener traffic with all ports opened (within VPC)"
#   vpc_id      = module.vpc.vpc_id

#   ingress_cidr_blocks = var.vpc_cidr_block
#   ingress_rules = [
#     "all-all"
#   ]

#   egress_cidr_blocks = ["0.0.0.0/0"]
#   egress_rules = [
#     "all-all"
#   ]
# }
