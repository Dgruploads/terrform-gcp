provider "google" {
  credentials = var.credentials_file
  project = var.project_name
  region  = var.region_name
  zone    = var.zone_name
}
