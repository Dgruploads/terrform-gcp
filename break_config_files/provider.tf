provider "google" {
  credentials = file("creds.json")
  project = var.project_name
  region  = var.region_name
  zone    = var.zone_name
}
