module "yc-instance" {
  source = "./terraform/modules/app"

  yc_zone  = "ru-central1-a"
  ssh_pub  = var.ssh_pub
  ssh_key  = var.ssh_key
  dns_zone = "somikhailov-fun"
}

module "ansible_provision" {
  source = "./terraform/modules/ansible_provision"

  ansible_inventory_template = "ansible/inventory.tmpl"
  ansible_inventory          = "ansible/inventory.ini"
  ansible_playbook           = "ansible/site.yml"
  ansible_hosts = {
    app = module.yc-instance.name_ip
  }
  ssh_key = var.ssh_key
  user    = "ubuntu"
}