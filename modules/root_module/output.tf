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
