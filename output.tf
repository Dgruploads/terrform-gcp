provider "google" {
  credentials = file("../creds.json")
  project = "adept-primacy-383707"
  region  = "us-east4"
  zone    = "us-east4-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"

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


resource "google_compute_disk" "custom_disk" {
  name  = "custom-disk"
  type  = "pd-ssd"
  zone  = "us-east4-c"
  image = "debian-11-bullseye-v20220719"
  labels = {
    environment = "development"
  }
  physical_block_size_bytes = 4096
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

output "disk_id" {
  value = google_compute_disk.custom_disk.id
}

output "disk_name" {
    value = google_compute_disk.custom_disk.name
}

output "disk_value" {
    value = google_compute_disk.custom_disk.image
}
