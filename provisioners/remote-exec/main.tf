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

  metadata = {
    ssh-keys = "rabi:${file("./gcloud_instance.pub")}"
  }

  connection {
      type = "ssh"
      user = "rabi"
      private_key = "${file("./gcloud_instance")}"
      host = self.network_interface[0].access_config[0].nat_ip
      port = 22
      agent = false
    }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh >> script.log"
    ]
  }
}
