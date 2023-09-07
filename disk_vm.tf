resource "yandex_compute_disk" "newdisk" {
  count = length(var.disk_count)
  name       = "${"newdisk"}${count.index}"
  type       = "network-hdd"
  size       = 1
}

resource "yandex_compute_instance" "storage" {
  count = 1
  name        = "storage"
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
  
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.newdisk.*.id
    content {
      disk_id  = secondary_disk.value
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
  depends_on = [yandex_compute_disk.newdisk]
}