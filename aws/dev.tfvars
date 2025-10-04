provider_assume_role_arn = "arn:aws:iam::806153319059:role/terraform"
region                   = "us-east-1"
availability_zones = [
  "eu-central-1a",
  "eu-central-1b",
  "eu-central-1c"
]
environment = "development"

# Account
account_name = "dev-ks"
account_id   = 806153319059

create_developer_role = true

# Whom should we trust this account to
# trusted_role_arns = [
#   "arn:aws:iam::578003659821:root"
# ]

# ghaction identity provider module
# ghaction_oidc_role_enabled               = true
# ghaction-oidc-role-policy_enabled        = true
# ghaction-oidc-role-policy_attach_enabled = true

keyslotsActive = { primary = 1
  slot0 = false
slot1 = true }

# secretNames = ["saplp-dev", "gardener-lp-dev"]
