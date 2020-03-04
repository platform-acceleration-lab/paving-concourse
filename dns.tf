data "google_dns_managed_zone" "hosted-zone" {
  name = var.hosted_zone
}

resource "google_dns_record_set" "ops-manager" {
  name = "opsmanager.${data.google_dns_managed_zone.hosted-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = var.hosted_zone

  rrdatas = [google_compute_address.ops-manager.address]
}

resource "google_dns_record_set" "concourse" {
  name = "ci.${data.google_dns_managed_zone.hosted-zone.dns_name}"
  type = "A"
  ttl  = 60

  managed_zone = var.hosted_zone

  rrdatas = [google_compute_address.concourse.address]
}
