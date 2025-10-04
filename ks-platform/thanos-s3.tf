module "thanos-s3" {
  count      = var.thanos_enabled ? 1 : 0
  source     = "../modules/thanos-s3/"
  stage = var.stage
}