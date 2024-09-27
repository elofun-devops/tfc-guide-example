output dns_namespaces {
  value = google_dns_managed_zone.public-zone.name_servers
}