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


resource "google_compute_disk" "custom_disk" {
  name  = var.disk_name
  type  = var.disk_type
  zone  = var.zone_name
  image = var.resource_image
  labels = {
    environment = var.disk_label
  }
  physical_block_size_bytes = var.disk_size
}

resource "google_storage_bucket" "auto-expire" {
  name          = "dgruploads-example-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_compute_network" "vpc_network" {
  project                 = "dgruploads-custom-network"
  name                    = "dgruploads-custom-network"
  auto_create_subnetworks = true
  mtu                     = 1460
}
