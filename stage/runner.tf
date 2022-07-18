resource "yandex_compute_instance" "runner" {
  name                      = "runner"
  zone                      = var.zones[2]
  hostname                  = "runner.exraydi.ru"
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
      ip_address  = "192.168.102.103"
      nat       = false
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }
