provider "google" {
  project = "adept-primacy-383707"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_firewall" "gh-9564-firewall-externalssh" {
  count   = 2
  name    = "gh-9564-firewall-${count.index}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["externalssh-${count.index}"]
}

resource "google_compute_instance" "dev1" {
  count        = 2
  name         = "gcp-rhel7-${count.index}"
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
  count = 2
  name          = "dgruploads-bucket-${count.index}"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
