provider_assume_role_arn = "arn:aws:iam::209082373788:role/TerraformExecutionRole"
region                   = "ap-south-2"
availability_zones = [
  "ap-south-2a",
  "ap-south-2b",
]
environment = "development"

# Account
account_name = "dev1"
account_id   = 209082373788

create_developer_role = true

# ghaction identity provider module
# ghaction_oidc_role_enabled               = true
# ghaction-oidc-role-policy_enabled        = true
# ghaction-oidc-role-policy_attach_enabled = true

keyslotsActive = { primary = 1
  slot0 = false
slot1 = true }

# secretNames = ["saplp-dev", "gardener-lp-dev"]
