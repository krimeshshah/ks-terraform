# AWS ks vpc
module "security_group_ks" {
  source = "terraform-aws-modules/security-group/aws"

  create      = var.create_sg
  name        = "ks-sg-${var.stage}"
  description = "Security group for Gardener traffic with all ports opened (within VPC)"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = [
    "http-80-tcp",
    "ssh-tcp"
  ]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8000
      to_port     = 8000
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "HTTP traffic on port 8000"
    }
  ]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = [
    "all-all"
  ]

  tags = {
    Terraform   = "true"
    Environment = var.stage
  }

}


# -------------------------------------------------
# Bastion Host Security Group
# -------------------------------------------------
module "security_group_bastion" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ks-sg-bastion-${var.stage}"
  description = "Security group for Bastion host - SSH only"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = {
    Terraform   = "true"
    Environment = var.stage
  }
}