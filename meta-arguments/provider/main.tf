## This will use the default provider configuration
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

## This will use the alternate provider configuration
resource "google_compute_instance" "vm_instance_alternate" {
    provider     = google.Oregon
    name         = var.alternate_resource_name
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
