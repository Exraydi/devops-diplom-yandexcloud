output "internal_ip_address_nginx_yandex_cloud" {
  value = "${yandex_compute_instance.nginx.network_interface.0.ip_address}"
}

output "external_ip_address_nginx_yandex_cloud" {
  value = "${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"
}
