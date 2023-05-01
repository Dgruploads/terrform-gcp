provider "google" {
  project = "adept-primacy-383707"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_firewall" "gh-9564-firewall-externalssh" {
  name    = "gh-9564-firewall-externalssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["externalssh"]
}

resource "google_compute_instance" "dev1" {
  name         = "gcp-rhel7-dev1-tf"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  tags         = ["externalssh"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  # Ensure firewall rule is provisioned before server, so that SSH doesn't fail.
  depends_on = [google_compute_firewall.gh-9564-firewall-externalssh,google_storage_bucket.auto-expire]

}

resource "google_storage_bucket" "auto-expire" {
  name          = "dgruploads-public-access-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
