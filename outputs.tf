output "cluster_name" {
  value = module.eks.cluster_name
}

output "nginx_service" {
  value = module.app.nginx_service_name
}
