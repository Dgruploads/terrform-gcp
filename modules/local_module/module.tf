module "child_module_example" {
  project_name          = var.project_name
  region_name           = var.region_name
  source                = "../local_module"
  resource_name         = var.resource_name
  resource_machine_name = var.resource_machine_name
  resource_image        = var.resource_image
  network_type          = var.network_type
  zone_name             = var.zone_name
  bucket_name           = var.bucket_name
  bucket_location       = var.bucket_location
  bucket_destroy_status = var.bucket_destroy_status
  bucket_public_access  = var.bucket_public_access
  network_name          = var.network_name
  subnetwork_create_status = var.subnetwork_create_status
  network_mtu              = var.network_mtu
}
