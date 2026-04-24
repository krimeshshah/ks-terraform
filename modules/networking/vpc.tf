module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "vpc-${var.stage}"
  cidr = var.vpc_cidr_block

  azs             = var.availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  ## Note since we already have public subnets define above, vpc module itself will create internet-gw and create route table associting with public subnets. 
  ## Hence we dont need to create igw resouce separately

  enable_ipv6             = var.vpc_enable_ipv6
  map_public_ip_on_launch = var.map_public_ip_on_launch

  # TODO: for compatibility disable management of default network acl and route table, may want to enable this and run import
  manage_default_network_acl    = false
  manage_default_route_table    = false
  manage_default_security_group = false


  # TODO: for compatibility, maybe we want to have dns64 and nat64 but for now disable it
  public_subnet_enable_dns64  = false
  private_subnet_enable_dns64 = false
  intra_subnet_enable_dns64   = false

  # TODO: also for comaptibility but enabling these is likely very low risk and sounds like a good idea
  public_subnet_enable_resource_name_dns_aaaa_record_on_launch  = false
  private_subnet_enable_resource_name_dns_aaaa_record_on_launch = false
  intra_subnet_enable_resource_name_dns_aaaa_record_on_launch   = false

  # DNS
  default_vpc_enable_dns_hostnames = true
  default_vpc_enable_dns_support   = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # Gateways
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false ## Set it to true for production env. where high availability is require.
  enable_vpn_gateway     = false ## Set it to true when you need Site-to-site vpn


  # VPC Flow Logs
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true

  tags = {
    Terraform   = "true"
    Environment = var.stage
  }
}