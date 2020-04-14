provider "google" {
  project = "single-brace-265016"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

provider "kubectl" {
  load_config_file = true
}