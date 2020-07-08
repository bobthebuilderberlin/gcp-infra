resource "google_dns_managed_zone" "prod" {
  name     = "prod-zone"
  dns_name = "robertandruschow.de."
}

resource "google_dns_managed_zone" "prod2" {
  name     = "prod-zone2"
  dns_name = "andruschow.de."
}