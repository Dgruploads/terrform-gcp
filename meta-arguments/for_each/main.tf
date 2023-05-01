resource "google_compute_instance" "dev1" {
  for_each    = var.instance_image
  name         = "terraform-instance-${each.key}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  tags         = ["externalssh"]

  boot_disk {
    initialize_params {
      image = each.value
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_storage_bucket" "auto-expire" {
  for_each      = var.bucket_name
  name          = each.value
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
