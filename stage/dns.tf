
resource "yandex_dns_zone" "zone1" {
  name        = "exraydi-public-zone"
  description = "Exraydi public zone"

  labels = {
    label1 = "exraydi-public"
  }

  zone    = "exraydi.ru."
  public  = true
}


resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "exraydi.ru."
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
}

resource "yandex_dns_recordset" "rs2" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "www.exraydi.ru."
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
}


resource "yandex_dns_recordset" "rs3" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "gitlab.exraydi.ru."
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
}

resource "yandex_dns_recordset" "rs4" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "grafana.exraydi.ru."
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
}

resource "yandex_dns_recordset" "rs5" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "prometheus.exraydi.ru."
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
}

resource "yandex_dns_recordset" "rs6" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "alertmanager.exraydi.ru."
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
}
