output "internal_ip_address_vm" {
  value = yandex_compute_instance.vm.network_interface.0.ip_address
}

output "name_ip" {
  value = {
    "${yandex_compute_instance.vm.name}" = "${yandex_compute_instance.vm.network_interface.0.nat_ip_address}"
  }
}