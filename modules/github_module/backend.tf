terraform {
  backend "gcs" {
    bucket = "dgruploads-terraform-state-file"
    prefix = "terraform_state_file"
  }
}
