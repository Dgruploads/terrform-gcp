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

  lifecycle {
    create_before_destroy = true
  }
}
