resource "google_dns_managed_zone" "prod" {
  name     = "prod-zone"
  dns_name = "robertandruschow.de."
}