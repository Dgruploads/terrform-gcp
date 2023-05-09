resource "google_compute_instance" "vm_instance" {
  name         = var.resource_name
  machine_type = var.resource_machine_name

  boot_disk {
    initialize_params {
      image = var.resource_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = var.network_type
    access_config {
    }
  }
}

resource "google_storage_bucket" "auto-expire" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = var.bucket_destroy_status

  public_access_prevention = var.bucket_public_access
}

resource "google_compute_network" "vpc_network" {
  project                 = var.project_name
  name                    = var.network_name
  auto_create_subnetworks = var.subnetwork_create_status
  mtu                     = var.network_mtu
}
