#создаем

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=e801fb6"
  env_name        = "develop"
  network_id      = module.network.network_id
  subnet_zones    = module.network.zone
  subnet_ids      = module.network.v4_cidr_blocks
  instance_name   = "web"
  instance_count  = 1
  image_family    = "ubuntu-2004-lts"
  public_ip       = true

  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
  }
}
module "network" {
    source              = "./module_network"
}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
 vars = {
   ssh_public_key = file(var.ssh_public_key)
 }
}
