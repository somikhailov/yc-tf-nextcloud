resource "yandex_compute_instance" "vm" {
  name        = "vm"
  platform_id = "standard-v1"
  zone        = var.yc_zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8mfc6omiki5govl68h"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_pub)}"
  }
}

resource "yandex_vpc_network" "net-1" {}

resource "yandex_vpc_subnet" "subnet-1" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.net-1.id
}