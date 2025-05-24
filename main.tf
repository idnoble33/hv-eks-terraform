provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source          = "./modules/vpc"
  name            = "hv"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "hv-eks-cluster"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = concat(module.vpc.private_subnet_ids, module.vpc.public_subnet_ids)
  cluster_version = "1.28"
  aws_region      = var.aws_region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks.cluster_name,
      "--region",
      var.aws_region
    ]
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

resource "time_sleep" "wait_for_cluster" {
  create_duration = "2m"
  depends_on = [module.eks]
}

module "app" {
  source     = "./modules/app"
  depends_on = [
    time_sleep.wait_for_cluster,
    kubernetes_config_map.aws_auth
  ]
}