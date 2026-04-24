# AWS ks vpc
module "security_group_eks" {
  source = "terraform-aws-modules/security-group/aws"

  create      = var.create_sg
  name        = "ks-sg-${var.stage}"
  description = "Security group for Gardener traffic with all ports opened (within VPC)"
  vpc_id      = module.vpc.vpc_id

  ## note ingress_rules and ingress_rules_with_cidr block conflict so dont use it together, instead create ingress_with-cidr_blocks
  # ingress_cidr_blocks = ["0.0.0.0/0"] 
  # ingress_rules = [
  #   "http-80-tcp",
  #   "ssh-tcp"
  # ]

  #Below ingress block can be used when you dont use lb to route the traffic but instead asg instances are in public subnet and traffic is directly routed to
  ## Asg EC2 instances
  # ingress_with_cidr_blocks = [
  #   {
  #     from_port   = 8000
  #     to_port     = 8000
  #     protocol    = "tcp"
  #     cidr_blocks = "0.0.0.0/0"
  #     description = "HTTP traffic on port 8000"
  #   }
  # ]
  #### Below ingress block is used as we are going to use lb and target group (ASG (auto-scaling-grp) instances) need to allow sec. grp of lb sec. group
  ingress_with_source_security_group_id = [
    {
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      source_security_group_id = var.alb_security_group_id
      description              = "Allow ALB traffic to ASG on port 8080"
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
# module "security_group_bastion" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "ks-sg-bastion-${var.stage}"
#   description = "Security group for Bastion host - SSH only"
#   vpc_id      = module.vpc.vpc_id

#   ingress_cidr_blocks = ["0.0.0.0/0"]
#   ingress_rules       = ["ssh-tcp"]

#   egress_cidr_blocks = ["0.0.0.0/0"]
#   egress_rules       = ["all-all"]

#   tags = {
#     Terraform   = "true"
#     Environment = var.stage
#   }
# }