output "cluster_name" {
  value = module.gke.cluster_name
}
output "get_credentials_command" {
  value = "gcloud container clusters get-credentials ${module.gke.cluster_name} --region ${var.region} --project ${var.project_id}"
}
