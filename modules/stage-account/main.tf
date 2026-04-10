terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  #profile = "Terraform-management"
  profile = "Terraform-Backend-mgmt"
  region = var.region
  assume_role {
    role_arn    = var.provider_assume_role_arn
  }
}