variable "account_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "description"
}

# General
variable "provider_assume_role_arn" {
  type = string
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "environment" {
  type = string
}

variable "account_id" {
  type    = number
  default = 806153319059 ## Exp
}

variable "trusted_role_arns" {
  type    = list(string)
  default = ["arn:aws:iam::578003659821:root"] ## Exp
}

# Other
variable "create_developer_role" {
  type    = bool
  default = true
}


#### variables for ghaction oidc identity provider roles

# variable "ghaction_oidc_issuer_url" {
#   type    = string
#   default = "https://github.tools.sap/_services/token"
# }

# variable "ghaction_oidc_issuer" {
#   type    = string
#   default = "github.tools.sap/_services/token"
# }

variable "ghaction_oidc_audience" {
  type    = string
  default = "sts.amazonaws.com"
}

variable "ghaction_oidc_role_enabled" {
  type    = bool
  default = false
}

variable "ghaction-oidc-role-policy_enabled" {
  type    = bool
  default = false
}

variable "ghaction-oidc-role-policy_attach_enabled" {
  type    = bool
  default = false
}

variable "route53_enabled" {
  type    = bool
  default = false
}

variable "keyslotsActive" {
  type = object({
    slot0   = bool
    slot1   = bool
    primary = number
  })
}

variable "secretNames" {
  type    = list(string)
  default = null
}

