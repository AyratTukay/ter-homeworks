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

variable "ssh_public_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH8lnFOyyfXEG7RVccooTzblpajN4fXZJGBSdlwtwJGm ayrat@Ayrat"
  description = "ssh-keygen -t ed25519"
}

variable "image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
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

variable "db_user" { 
  type = string 
  default = "user-db"
  }

variable "db_password" { 
  type = string 
  default = "dbmysqlpassword"
 }
variable "db_name" { 
  type = string
  default = "app_db"
  }

variable "db_host" { 
  type = string 
  default = "temp-host"
  }

variable "vm_name" { 
  type = string 
  default = "terraform-project" 
}

variable "registry_id" {
  type = string 
  default = "terraform-project-registry"
  }

variable "vm_cores" { 
  type = number 
  default = 2 
  }

variable "vm_memory" { 
  type = number 
  default = 2 
  }

variable "vm_disk_size" { 
  type = number 
  default = 20
  }
