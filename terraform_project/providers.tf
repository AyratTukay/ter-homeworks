terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.209.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.0"
    }
  }
  required_version = ">1.12.0"
  backend "s3" {
    bucket  = "tfstate-tukaev"
    key     = "dev/terraform.tfstate"
    region  = "ru-central1"
         
    # Встроенный механизм блокировок (Terraform >= 1.6)
    # Не требует отдельной базы данных!
    use_lockfile = true
         
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
         
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }

}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
  service_account_key_file = file("~/.authorized_key.json")
}
