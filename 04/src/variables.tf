variable "cloud_id" {
  type        = string
  default     = "b1gph1m6av09n0f8h06f"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1gn9eg8fjcebenhm3o7"
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

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8lnFOyyfXEG7RVccooTzblpajN4fXZJGBSdlwtwJGm ayrat@Ayrat"
  description = "ssh-keygen -t ed25519"
}


variable "ip_address" {
  type = string
  description = "IP-адрес"
  default = "1920.1680.0.1"

  validation {
    condition = can(regex("^(192|10|172|192|168|25[0-5]|24[0-9]|25[0-5]|256)$", var.ip_address))
    error_message = "Неверный формат IP-адреса"
  }
}
/*
variable "ip_addresses" {
  type = list(string)
  description = "Список IP-адресов"
  default = [ "192.168.0.1", "1.1.1.1", "127.0.0.1" ]

  validation {
    condition = all(for addr in var.ip_addresses : can(regex(addr, var.ip_address)))
    error_message = "Неверный список IP-адресов"
  }
}*/