variable "eks_vpc_id" {
  type = string
}

variable "eks_subnet_ids" {
  type = list(string)
}
variable "eks_cp_subnet_ids" {
  type = list(string)
}

variable "eks_instance_types" {
  type = list(string)
}

variable "stage" {
  type = string
}