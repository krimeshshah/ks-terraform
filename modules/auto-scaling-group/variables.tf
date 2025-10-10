variable "target_group_arns" {
  type = string
}

variable "asg_security_group" {
  type = list(string)
}

variable "vpc_zone_identifier" {
  type = list(string)
}

variable "stage" {
  type = string
}