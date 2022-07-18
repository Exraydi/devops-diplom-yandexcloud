resource "yandex_compute_instance" "gitlab" {
  name                      = "gitlab"
  zone                      = var.zones[2]
  hostname                  = "gitlab.exraydi.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

    boot_disk {
        initialize_params {
          image_id = data.yandex_compute_image.ubuntu_image.id
          type        = "network-ssd"
          size        = "10"
        }
      }

    network_interface {
      subnet_id = "${yandex_vpc_subnet.default[2].id}"
      ip_address  = "192.168.102.102"
      nat       = false
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }
