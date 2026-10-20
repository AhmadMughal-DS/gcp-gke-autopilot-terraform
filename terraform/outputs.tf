output "cluster_name" {
  description = "GKE Autopilot cluster name"
  value       = google_container_cluster.this.name
}

output "cluster_endpoint" {
  description = "GKE control-plane endpoint"
  value       = google_container_cluster.this.endpoint
  sensitive   = true
}

output "get_credentials_command" {
  description = "Configure kubectl for the cluster"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.this.name} --region ${var.region} --project ${var.project_id}"
}
