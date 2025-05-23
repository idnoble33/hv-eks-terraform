output "nginx_service_name" {
  value = var.deploy_k8s_resources ? kubernetes_service.nginx[0].metadata[0].name : ""
}
