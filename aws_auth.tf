resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode([
      {
        rolearn  = module.eks.eks_managed_node_groups["default"].iam_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"
        groups   = ["system:bootstrappers", "system:nodes"]
      },
      {
        rolearn  = module.eks.cluster_iam_role_arn
        username = "terraform"
        groups   = ["system:masters"]
      }
    ])
  }

  depends_on = [module.eks]
  
  lifecycle {
    ignore_changes = [
      metadata[0].annotations,
      metadata[0].labels
      # Removed metadata[0].resource_version as it's redundant
    ]
  }
}