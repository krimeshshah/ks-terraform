variable "db_prefix" {
  type    = string
  default = "fastapi"
}

variable "stage" {
  type = string
}

variable "database_subnets" {
  type = list(string)
}

variable "vpc_security_group_ids" {
  type = list(string)
}