terraform {
  backend "s3" {
    bucket  = "terraform-ks-backend-state"
    key     = "terraform-state/ks-platform/terraform.tfstate"
    region  = "ap-south-2"
    encrypt = true
    profile = "Terraform-Backend-mgmt"
  }
}