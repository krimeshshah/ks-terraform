
provider_assume_role_arn = "arn:aws:iam::209082373788:role/TerraformExecutionRole"
region                   = "ap-southeast-2"
account_name             = "dev1"

stage = "dev"

# create_developer_role = true


# # trusted_role_arns = [
# #   "arn:aws:iam::578003659821:root" # saplp  
# ]

networking_enabled  = true
create_sg           = true
vpc_private_subnets = ["10.0.0.64/26", "10.0.0.192/26"]
vpc_public_subnets  = ["10.0.0.0/28", "10.0.0.16/28"]
vpc_cidr_block      = "10.0.0.0/24"

## auto scaling group parameters
asg_enabled = true

## loadbalance
loadbalancer_enabled = true

# eks
eks_enabled = false


## thanos
thanos_enabled = false
