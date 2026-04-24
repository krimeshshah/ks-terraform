output "aws_lb_target_group_arns" {
  value = module.alb.target_groups["ks-instance"].arn
}

output "alb_security_group_id" {
  value = module.alb.security_group_id
}

## Enable below block if you are going to use LB with static target instance with known target id (instance id). If we are using ASG then dont use it
# output "aws_lb_target_id" {
#   value = module.alb.target_groups["ks-instance"].id
# }