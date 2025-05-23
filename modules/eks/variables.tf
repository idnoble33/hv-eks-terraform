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

variable "cluster_version" {
    type = string
  
}
variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
}

