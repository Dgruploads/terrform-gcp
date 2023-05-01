variable "instance_image" {
  type = map(any)
  description = "Image to use when launching the instances"
}

variable "bucket_name" {
  type    = map(any)
  description = "Name of the bucket to create"
}
