locals {
    aws_iam_policy_arn = module.rds-iam-policy.aws_iam_policy_arn
}

module "rds-iam-policy" {
    source = "../modules/rds-iam-policy"
    rds_db_instance_resource_id = local.rds_db_instance_resource_id
}