
provider_assume_role_arn = "arn:aws:iam::209082373788:role/TerraformExecutionRole"
region                   = "ap-south-2"
account_name             = "dev1"

stage = "dev"

# create_developer_role = true


# # trusted_role_arns = [
# #   "arn:aws:iam::578003659821:root" # saplp  
# ]

networking_enabled  = true
create_sg           = false
vpc_private_subnets = ["10.0.8.0/21", "10.0.4.0/22", "10.0.2.0/23"]
vpc_public_subnets  = ["10.0.64.0/18", "10.0.32.0/19", "10.0.16.0/20"]
availability_zones  = ["ap-south-2a", "ap-south-2b", "ap-south-2c"]
vpc_cidr_block      = "10.0.0.0/16"

## auto scaling group parameters
asg_enabled = false

## loadbalance
loadbalancer_enabled = false

# eks
eks_enabled        = true
eks_instance_types = ["m6i.large"]


## thanos
thanos_enabled = false

### rds
create_rds                 = true
namespace_service_accounts = ["fastapi:fastapi"]
# namespace = "fastapi"
# service_account = "fastapi"