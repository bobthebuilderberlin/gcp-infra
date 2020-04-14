provider "google" {
  project = "single-brace-265016"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

variable "ssh-public-key-location" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh-key-account-name" {
  default = "robert"
}
