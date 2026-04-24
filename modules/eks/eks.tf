# data "aws_ssm_parameter" "eks__optimized_ami" {
#    name = "/aws/service/eks/optimized-ami/1.33/amazon-linux-2023/x86_64/standard/recommended/image_id"
# }

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "eks-${var.stage}"
  kubernetes_version = "1.33"

  endpoint_public_access = true
  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true


  access_entries = {
    # One access entry with a policy associated
    dev-sso-cluster-admin = {
      principal_arn = "arn:aws:iam::209082373788:role/aws-reserved/sso.amazonaws.com/ap-south-2/AWSReservedSSO_AdministratorAccess_831c0b0dd15e4a48"

      policy_associations = {
        dev-sso-admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  addons = {
    coredns = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
  }

  vpc_id                   = var.eks_vpc_id
  subnet_ids               = var.eks_subnet_ids
  control_plane_subnet_ids = var.eks_cp_subnet_ids
  enable_irsa              = true

  # EKS Managed Node Group(s)
  # eks_managed_node_group_defaults = {
  #   instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  # }

  eks_managed_node_groups = {
    "ks-eks-${var.stage}" = {
      ami_type     = "AL2023_x86_64_STANDARD"
      min_size     = 3
      max_size     = 5
      desired_size = 3

      instance_types = var.eks_instance_types
      capacity_type  = "SPOT"
    }
  }


  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}


## Below Module config is for Quick configu EKS Automode

# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 21.0"

#   name               = "ks-${var.stage}"
#   kubernetes_version = "1.33"

#   # Optional
#   endpoint_public_access = true

#   # Optional: Adds the current caller identity as an administrator via cluster access entry
#   enable_cluster_creator_admin_permissions = true

#   # compute_config = {
#   #   enabled    = true
#   #   node_pools = ["general-purpose"]
#   # }

#   vpc_id     = var.vpc_id
#   subnet_ids = var.eks_subnet_id

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }