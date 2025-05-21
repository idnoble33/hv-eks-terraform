variable "cluster_name" {
  type    = string
  default = "hv-eks-cluster"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
