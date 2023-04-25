provider "google" {
  project = "adept-primacy-383707"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-1404-trusty-v20160406"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  
  provisioner "local-exec" {
   command = "echo ${self.network_interface.0.network_ip} >> private_ips.txt"
 }

 provisioner "local-exec" {
   command = "echo ${self.network_interface.0.access_config.0.nat_ip} >> public_ips.txt"
 }
}
