output "vm_web_external_ip_address" {
value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
description = "vm web external ip"
}
output "vm_db_external_ip_address" {
value = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
description = "vm db external ip"
}