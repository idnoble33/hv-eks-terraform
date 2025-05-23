# module "eks" {
#   source          = "terraform-aws-modules/eks/aws"
#   version         = "20.8.4"

#   cluster_name    = var.cluster_name
#   cluster_version = var.cluster_version
#   vpc_id          = var.vpc_id
#   subnet_ids      = var.subnet_ids

#   eks_managed_node_groups = {
#     default = {
#       desired_capacity = 1
#       max_capacity     = 3
#       min_capacity     = 1
#       instance_types   = ["t3.medium"]
#     }
#   }
#   endpoint_public_access = true
#   endpoint_private_access = true  # optional, allows access inside VPC as well

#   tags = {
#     Environment = "hv"
#     Terraform   = "true"
#   }
# }

# # Wait until cluster ACTIVE - no changes needed
# resource "null_resource" "wait_for_cluster" {
#   provisioner "local-exec" {
#     command = <<EOT
#       for i in {1..30}; do
#         echo "Waiting for EKS to become ACTIVE (attempt $i)..."
#         STATUS=$(aws eks describe-cluster --region ${var.aws_region} --name ${var.cluster_name} --query "cluster.status" --output text)
#         if [ "$STATUS" = "ACTIVE" ]; then
#           echo "Cluster is ACTIVE."
#           exit 0
#         fi
#         sleep 10
#       done
#       echo "Cluster did not become ACTIVE in time."
#       exit 1
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }

#   depends_on = [module.eks]
# }

# # Data sources for cluster info
# data "aws_eks_cluster" "cluster" {
#   name       = module.eks.cluster_name
#   depends_on = [null_resource.wait_for_cluster]
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name       = module.eks.cluster_name
#   depends_on = [null_resource.wait_for_cluster]
# }

# # Kubernetes provider config
# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
# }

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  eks_managed_node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  tags = {
    Environment = "hv"
    Terraform   = "true"
  }
}
