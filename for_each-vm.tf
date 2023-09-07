resource "yandex_compute_instance" "virtual" {
  for_each = {for vm in var.virtual : vm.vm_name => vm}
  name = "${each.value.vm_name}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = "${each.value.cpu}"
    memory        = "${each.value.ram}"
    core_fraction = var.vm_web_resources.vm_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    size = "${each.value.disk}"
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
    ssh-keys           = "${"ubuntu"}:${file("/root/.ssh/id_ed25519.pub")}"
  }
  depends_on = [yandex_compute_instance.ubuntu]
}
