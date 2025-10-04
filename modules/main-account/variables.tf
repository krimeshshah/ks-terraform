# General
variable "region" {
  type    = string
  default = "eu-central-1"
}

# Account
variable "account_name" {
  type = string
}

# Assumable Roles
# variable "admin_assumable_role_arns" {
#   type    = list(string)
#   default = []
# }

# variable "developer_assumable_role_arns" {
#   type    = list(string)
#   default = []
# }

# variable "stakeholder_assumable_role_arns" {
#   type    = list(string)
#   default = []
# }