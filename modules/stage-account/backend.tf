terraform {
  backend "s3" {
    # bucket = "terraform-ks-backend"
    bucket  = "terraform-ks-backend-state"
    key     = "terraform-state/stage-account/terraform.tfstate"
    region  = "ap-south-2"
    profile = "Terraform-Backend-mgmt"
    # profile = "terraform-runner"
    # role_arn = "arn:aws:iam::184670914952:role/TerraformRunner"
  }
}