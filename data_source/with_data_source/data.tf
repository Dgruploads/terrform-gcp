data "google_compute_disk" "compute_disk" {
  name = "terraform-disk"
}

data "google_compute_network" "custom_network" {
  name = "vpc-network"
}
