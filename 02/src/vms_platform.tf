###cloud vars

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
}
variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
}


variable "vm_db_family" {
  type = string
  default = "ubuntu-2004-lts"
}

/*variable "vm_db_name" {
  type = string
  default = "netology-develop-platform-db"
}*/

variable "vm_db_platform_id" {
  type = string
  default = "standard-v4a"
}
/*
variable "vm_db_cores" {
  type = number
  default = 2
}

variable "vm_db_memory" {
  type = number
  default = 2
}

variable "vm_db_core_fraction" {
  type = number
  default = 20
}
*/
variable "vpc_vm_db_name" {
  type        = string
  default     = "develop-2"
}