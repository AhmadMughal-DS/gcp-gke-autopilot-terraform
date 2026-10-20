locals {
  name = var.project_name
  labels = {
    project    = var.project_name
    managed_by = "terraform"
    owner      = "muhammad-ahmad"
  }
}

############################
# VPC-native network
############################
resource "google_compute_network" "this" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name          = "${local.name}-subnet"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.region
  network       = google_compute_network.this.id

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.20.0.0/16"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.30.0.0/16"
  }
}

############################
# GKE Autopilot cluster
############################
resource "google_container_cluster" "this" {
  name     = "${local.name}-autopilot"
  location = var.region

  enable_autopilot = true

  network    = google_compute_network.this.id
  subnetwork = google_compute_subnetwork.this.id

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  deletion_protection = false
  resource_labels     = local.labels
}
