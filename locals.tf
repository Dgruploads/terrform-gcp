provider "google" {
  project = "adept-primacy-383707"
  region  = "us-east4"
  zone    = "us-east4-c"
}

locals {
  name         = "appserver"
  project_name = "exampleproject"
  owner        = "teamname"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  tags         = [local.name, local.project_name, local.owner]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

output "instance_id" {
  value = google_compute_instance.vm_instance.name
}

output "instance_name" {
  value = google_compute_instance.vm_instance.instance_id
}

output "instance_ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}
