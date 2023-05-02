# Default provider configuration
provider "google" {
    project = var.project_name
    region  = var.default_region_name
    zone    = var.default_zone_name
}
