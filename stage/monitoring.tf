resource "yandex_compute_instance" "monitoring" {
  name                      = "monitoring"
  zone                      = var.zones[2]
  hostname                  = "monitoring.exraydi.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

    boot_disk {
        initialize_params {
          image_id = data.yandex_compute_image.ubuntu_image.id
        }
      }

    network_interface {
      subnet_id = "${yandex_vpc_subnet.default[2].id}"
      ip_address  = "192.168.102.101"
      nat       = false
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }

resource "yandex_dns_recordset" "rsmonitoring" {
      zone_id = yandex_dns_zone.zone1.id
      name    = "monitoring.exraydi.ru."
      type    = "A"
      ttl     = 200
      data    = ["${yandex_compute_instance.monitoring.network_interface.0.ip_address}"]
    }
