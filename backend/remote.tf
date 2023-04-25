provider "google" {
  project = "adept-primacy-383707"
  region  = "us-central1"
  zone    = "us-central1-c"
}


terraform {
  backend "gcs" {
    bucket = "dgruploads-terraform-state-file"
    prefix = "terraform_state_file/terraform.tfstate"
  }
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
