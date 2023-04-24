variable "project_name" {
  type        = string
  description = "Name of the project to create the resources."
}

variable "region_name" {
  type        = string
  description = "name of the region to create the resources"
}

variable "zone_name" {
  type        = string
  description = "name of the zone to create the resources"
}

variable "resource_name" {
  type        = string
  description = "Name of the google compute engine resource"
}

variable "resource_machine_name" {
  type        = string
  description = "Machine type for the google compute engine resource"
}

variable "resource_image" {
  type        = string
  description = "Image to used to launch the machine"
}

variable "network_type" {
  type        = string
  description = "Name of the network to create the resources"
}

variable "disk_name" {
  type        = string
  description = "Name of the google cloud disk"
}

variable "disk_type" {
  type        = string
  description = "type of google cloud disk"
}

variable "disk_label" {
  type        = string
  description = "Label name of the google cloud disk"
}

variable "disk_size" {
  type        = number
  description = "Size of the google cloud disk"
}

variable "disk_image" {
  type        = string
  description = "Image for the google cloud disk"
}
