output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "eks_managed_node_groups" {
  value = module.eks.eks_managed_node_groups
}

output "cluster_iam_role_arn" {
  value = module.eks.cluster_iam_role_arn
}