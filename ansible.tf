resource "local_file" "ansible_inventory" {
  filename = "./temp.yml"
  content = templatefile("./ansible.tftpl", {
    web = yandex_compute_instance.ubuntu,
    db = yandex_compute_instance.virtual,
    disk = yandex_compute_instance.storage,
})
}
