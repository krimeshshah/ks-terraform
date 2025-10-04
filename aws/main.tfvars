# General
region = "us-east-1"

# Account
account_name = "uk-main"

# Assumable Roles
## Using wildcards to specify the AWS Account arn
##   meaning that, if the target account has that Role 
# ##   it should be assumable by the User
# admin_assumable_role_arns       = ["arn:aws:iam::*:role/Admin"]
# developer_assumable_role_arns   = ["arn:aws:iam::*:role/Developer"]
# stakeholder_assumable_role_arns = ["arn:aws:iam::*:role/Stakeholder"]

keyslotsActive = {
  primary = 1
  slot0   = true
  slot1   = true
}
