
provider_assume_role_arn = "arn:aws:iam::806153319059:role/terraform"
region                   = "us-east-1"
account_name             = "ks-dev"

stage = "dev"

# create_developer_role = true


# # trusted_role_arns = [
# #   "arn:aws:iam::578003659821:root" # saplp  
# ]

networking_enabled  = true
create_sg           = true
vpc_private_subnets = ["172.31.0.0/20", "172.31.16.0/20"]
vpc_public_subnets  = ["172.31.48.0/20", "172.31.64.0/20"]
vpc_cidr_block      = "172.31.0.0/16"

## auto scaling group parameters
asg_enabled = true

## loadbalance
loadbalancer_enabled = true

# eks
eks_enabled = false


## thanos
thanos_enabled = false
