module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  vpc_id          = var.vpc_id
  subnet_ids         = var.subnet_ids

  eks_managed_node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Environment = "hv"
    Terraform   = "true"
  }
}
