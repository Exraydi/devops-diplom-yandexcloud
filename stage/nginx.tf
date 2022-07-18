resource "yandex_compute_instance" "nginx" {
  name    = "nginx"
  zone     = var.zones[0]
  hostname   = "exraydi.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

    boot_disk {
        initialize_params {
          image_id = data.yandex_compute_image.ubuntu_image.id
        }
      }

    network_interface {
      subnet_id = "${yandex_vpc_subnet.default[0].id}"
      ip_address  = "192.168.100.110"
      nat       = true
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }
