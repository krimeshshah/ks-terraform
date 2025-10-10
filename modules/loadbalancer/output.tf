output "aws_lb_target_group_arns" {
  value = module.alb.target_groups["ks-instance"].arn
}

output "aws_lb_target_id" {
  value = module.alb.target_groups["ks-instance"].id
}