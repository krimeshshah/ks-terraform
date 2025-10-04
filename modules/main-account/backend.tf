terraform {
  backend "s3" {
    bucket = "terranostra-ks"
    key    = "terranostra-ks/terraform.tfstate"
    region = "us-east-1"
  }
}