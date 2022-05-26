module "yc-instance" {
  source = "./terraform/modules/app"

  yc_zone = "ru-central1-a"
  ssh_pub = var.ssh_pub
}