data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

resource "yandex_compute_instance" "ubuntu" {
  count       = 2
  name        = "web-${count.index+1}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_resources.vm_cores
    memory        = var.vm_web_resources.vm_memory
    core_fraction = var.vm_web_resources.vm_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = var.metadata.ssh-keys
  }
}