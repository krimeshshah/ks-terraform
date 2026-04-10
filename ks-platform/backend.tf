terraform {
  backend "s3" {
    bucket = "terraform-ks-backend-state"
    key    = "terraform-state/ks-platform/terraform.tfstate"
    region = "ap-south-2"
    profile = "Terraform-Backend-mgmt"
  }
}