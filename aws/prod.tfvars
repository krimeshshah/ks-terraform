# provider_assume_role_arn = "arn:aws:iam::209082373788:role/aws-reserved/sso.amazonaws.com/ap-south-2/AWSReservedSSO_AdministratorAccess_831c0b0dd15e4a48"
region = "ap-south-2"
availability_zones = [
  "ap-south-2a",
  "ap-south-2b",
]
environment = "prod"

# Account
account_name = "prod3"
account_id   = 997599126265

create_developer_role = true

# ghaction identity provider module
# ghaction_oidc_role_enabled               = true
# ghaction-oidc-role-policy_enabled        = true
# ghaction-oidc-role-policy_attach_enabled = true

keyslotsActive = { primary = 1
  slot0 = false
slot1 = true }

# secretNames = ["saplp-dev", "gardener-lp-dev"]
