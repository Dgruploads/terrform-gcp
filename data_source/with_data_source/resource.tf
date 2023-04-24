resource "google_compute_instance" "vm_instance" {
  name         = var.resource_name
  machine_type = var.resource_machine_name

  boot_disk {
    source = data.google_compute_disk.compute_disk.self_link
  }

  network_interface {
    # A default network is created for all GCP projects
    network = data.google_compute_network.custom_network.id
    access_config {
    }
  }
}
