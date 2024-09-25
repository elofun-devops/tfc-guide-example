provider "google" {
  project     = "demo"
  region      = "us-central1"
}
resource "google_dns_managed_zone" "public-zone" {
  name        = "hocdevops"
  dns_name    = "abc.hocdevops.me."
  description = "Demo DNS zone"
  labels = {
    foo = "demo"
  }
}

