resource "yandex_vpc_network" "net-1" {}

resource "yandex_vpc_subnet" "subnet-1" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.net-1.id
}