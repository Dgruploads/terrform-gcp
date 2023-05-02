# Default provider configuration
provider "google" {
    project = var.project_name
    region  = var.default_region_name
    zone    = var.default_zone_name
}

# Alternate provider configuration
provider "google" {
    alias   = "Oregon"
    project = var.project_name
    region  = var.alternate_region_name
    zone    = var.alternate_zone_name
}
