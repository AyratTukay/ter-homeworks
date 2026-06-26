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


variable "db_version" {
  type        = string
  default     = "8.0"
}

variable "db_disk_size" {
  type        = number
  default     = 10
}

variable "db_disk_type" {
  type        = string
  default     = "network-ssd"
}

variable "vm_name" { 
  type = string 
  default = "final-project" 
}