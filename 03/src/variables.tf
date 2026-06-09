###cloud vars
variable "token" {
  type        = string
  description = "IAM-token; https://yandex.cloud/ru/docs/iam/concepts/authorization/iam-token"
}

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

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name" 
}

variable "vm_web_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vms_resources" {
  default = {
    web = {
      cores = 2
      memory = 1
      core_fraction = 20
    }
  }
}

variable "each_vm" {
  type = list(object({  vm_name=string, cores =number, core_fraction=number, cpu=number, ram=number, disk_volume=number }))
  default = [
    {
      vm_name = "main"
      cores = 2
      core_fraction = 20
      cpu = 2
      ram = 1
      disk_volume = 5
    },
    {
      vm_name = "replica"
      cores = 2
      core_fraction = 20
      cpu = 2
      ram = 2
      disk_volume = 10
    }
  ]
}

variable "vm_web_platform_id" {
  type = string
  default = "standard-v1"
}

variable "vm_db_platform_id" {
  type = string
  default = "standard-v1"
}

variable "vm_storage_platform_id" {
  type = string
  default = "standard-v1"
}

variable "metadata" {
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8lnFOyyfXEG7RVccooTzblpajN4fXZJGBSdlwtwJGm ayrat@Ayrat"
  }
}