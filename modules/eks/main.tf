module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  # Cluster endpoint access configuration
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  # Node group configuration
  eks_managed_node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
      
      iam_role_additional_policies = {
        AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      }
    }
  }
  enable_cluster_creator_admin_permissions = true

  tags = {
    Environment = "hv"
    Terraform   = "true"
  }
}