variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}
variable "deploy_k8s_resources" {
  description = "Whether to deploy Kubernetes resources"
  type        = bool
  default     = false
}


