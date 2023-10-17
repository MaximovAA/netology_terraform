output "network_id" {
  value = yandex_vpc_network.develop.id
}

output "zone" {
  value = ["ru-central1-a"]
}

output "v4_cidr_blocks" {
  value = [yandex_vpc_subnet.develop.id]
}