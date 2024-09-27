provider "google" {
  project     = "logical-iridium-436709-g3"
  region      = "us-central1"
}

provider "cloudflare" {
  api_token = "s9HDHruP6ftoWkCn4LE2hPTW9fjvPJahkxbctltH"
}
resource "google_dns_managed_zone" "public-zone" {
  name        = "hocdevops"
  dns_name    = "abc.hocdevops.me."
  description = "Demo DNS zone"
  labels = {
    foo = "demo"
  }
}

data "cloudflare_zone" "main" {
  name = var.zone_name
}

resource "cloudflare_record" "google" {
  # for_each = google_dns_managed_zone.public-zone.name_servers
  zone_id = data.cloudflare_zone.main.id
  name    = "abc"
  value   = google_dns_managed_zone.public-zone.name_servers[0]
  type    = "NS"
}