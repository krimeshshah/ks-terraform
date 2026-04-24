terraform {
  backend "s3" {
    bucket         = "terraform-ks-backend-state"
    key            = "terraform-state/main-account/terraform.tfstate"
    region         = "ap-south-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    profile        = "Terraform-Backend-mgmt"
  }
}