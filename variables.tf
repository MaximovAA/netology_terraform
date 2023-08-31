###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###local



variable "netology-develop-platform" {
  type        = string
  default     = "netology-develop-platform"
}

variable "web" {
  type        = string
  default     = "web"
}

variable "db" {
  type        = string
  default     = "db"
}

variable "vm_web_resources" {
type = map(string)
default = {vm_cores = "2",vm_memory = "2",vm_core_fraction = "50"}
}

variable "vm_db_resources" {
type = map(string)
default = {vm_cores = "2",vm_memory = "2",vm_core_fraction = "20"}
}

variable "metadata" {
type = map(string)
default = {serial-port-enable = "1",ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPcXa1t17x3Ri1gCk9/Qn3InHu+hhQWmixT16Eg+RqI"}
}