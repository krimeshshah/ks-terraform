variable "account_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "provider_assume_role_arn" {
  type = string
}

variable "region" {
  type        = string
  default     = "ap-south-2"
  description = "description"
}

variable "networking_enabled" {
  type = bool
}

variable "stage" {
  type = string
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_enable_ipv6" {
  type    = bool
  default = true
}

variable "map_public_ip_on_launch" {
  type     = bool
  default  = false
  nullable = false
}

variable "enable_vpn_gateway" {
  type    = bool
  default = false
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "vpc_intra_subnets" {
  type    = list(string)
  default = []
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-2a", "ap-south-2b", "ap-south-2c"]
}

variable "asg_enabled" {
  type    = bool
  default = false
}

# variable "vpc_id" {
#     type = string
# }

variable "eks_enabled" {
  type = bool
}

variable "eks_instance_types" {
  type    = list(string)
  default = ["t3.micro"]
}

variable "thanos_enabled" {
  type    = bool
  default = false
}

variable "loadbalancer_enabled" {
  type    = bool
  default = false
}

variable "create_sg" {
  type    = bool
  default = true
}

variable "create_rds" {
  type    = bool
  default = false
}

variable "db_prefix" {
  type    = string
  default = "fastapi"
}

variable "namespace_service_accounts" {
  type = list(string)
}

# variable "namespace" {
#     type = string
# }

# variable "service_account" {
#     type = string
# }