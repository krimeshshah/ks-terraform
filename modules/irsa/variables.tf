# variable "attach_policy_arns" {
#   type = list(string)
# }

variable "namespace_service_accounts" {
  type = list(string)
}

variable "provider_arn" {
  type = string
}

variable "role_policy_arns" {
  type = string
}

# variable "namespace" {
#     type = string
# }

# variable "service_account" {
#     type = string
# }