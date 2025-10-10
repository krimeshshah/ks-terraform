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
  default     = "us-east-1"
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
  default = ["us-east-1a", "us-east-1b"]
}

variable "asg_enabled" {
  type = bool
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

# variable "environment" {
#   type = string
# }

# # Security Groups
# variable "gardener_cidr_blocks" {
#   type = list(string)
# }

# variable "palo_alto_cidr_blocks" {
#   type    = list(string)
#   default = ["10.0.0.0/16"]
# }

# variable "legacy_names" {
#   type    = bool
#   default = false
# }

# variable "create_sg" {
#   type    = bool
#   default = true
# }

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