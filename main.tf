terraform {
  backend "gcs" {
    bucket = "andruschow-infrastructure"
    prefix = "terraform/state"
  }
}

variable "ssh-public-key-location" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh-key-account-name" {
  default = "robert"
}
