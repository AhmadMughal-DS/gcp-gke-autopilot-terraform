locals {
  name_prefix = var.project_name
}

module "gke" {
  source      = "./modules/gke"
  name_prefix = local.name_prefix
  region      = var.region
  environment = var.environment
}
