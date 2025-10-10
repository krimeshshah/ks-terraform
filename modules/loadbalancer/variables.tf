variable "stage" {
  type = string
}

variable "lb_vpc_id" {
  type = string
}

variable "lb_vpc_public_subnet_ids" {
  type = list(string)
}
