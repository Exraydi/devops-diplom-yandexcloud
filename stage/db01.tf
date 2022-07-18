resource "yandex_compute_instance" "db01" {
  name                      = "db01"
  zone                      = var.zones[1]
  hostname                  = "db01.exraydi.ru"
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
      subnet_id = "${yandex_vpc_subnet.default[1].id}"
      ip_address  = "192.168.101.104"
      nat       = false
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }

resource "yandex_dns_recordset" "rsdb01" {
      zone_id = yandex_dns_zone.zone1.id
      name    = "db01.exraydi.ru."
      type    = "A"
      ttl     = 200
      data    = ["${yandex_compute_instance.db01.network_interface.0.ip_address}"]
    }
