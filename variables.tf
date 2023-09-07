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
  description = "VPC network&subnet name"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "example"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "example"
}

variable "vm_web_resources" {
type = map(string)
default = {vm_cores = "2",vm_memory = "2",vm_core_fraction = "20"}
}

variable "metadata" {
type = map(string)
default = {serial-port-enable = "1",ssh-keys = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIPcXa1t17x3Ri1gCk9/Qn3InHu+hhQWmixT16Eg+RqI"}
}

variable "virtual" {
    type = list(object({
    vm_name = string
    cpu  = number
    ram  = number
    disk = number
  }))
  default = [
    { vm_name = "main", cpu = 4, ram = 4, disk = 20 },
    { vm_name = "replica", cpu = 2, ram = 2, disk = 10 },
  ]
}

variable "disk_count" {
    type = list
  default = [0,1,2]
}