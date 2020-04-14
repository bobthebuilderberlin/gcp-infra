resource "google_storage_bucket" "static-site" {
  name          = "andruschow-infrastructure"
  location      = "EU"
}

terraform {
  backend "gcs" {
    bucket  = "andruschow-infrastructure"
    prefix  = "terraform/state"
  }
}