module "vpc" {
  source    = "./vpc"
  vpc_name  = "develop"
  default_zone  = "ru-central1-a"
  default_cidr  = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family    = var.image_family
  folder_id = "standard-images"
}

data "yandex_iam_service_account" "app_sa" {
  name = "terraform"
}

locals {
  cloud_init_config = templatefile("${path.module}/cloud-init.yml.tpl", {
    ssh_user       = var.ssh_user
    ssh_public_key = var.ssh_public_key
    db_host        = var.db_host
    db_user        = var.db_user
    db_password    = var.db_password
    db_name        = var.db_name
    registry_id    = var.my_registry_id
  })
}

resource "yandex_compute_instance" "app" {
  name        = "${var.vm_name}-vm"
  description = "VM for web application with Docker"
  hostname    = var.vm_name
  zone        = var.default_zone
  
  platform_id = "standard-v3"
  
  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }
  
  scheduling_policy {
    preemptible = true
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      name     = "${var.vm_name}-boot-disk"
      type     = "network-ssd"
      size     = var.vm_disk_size
    }
  }
  
  network_interface {
    subnet_id          = module.vpc.subnet_id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  
  metadata = {
    user-data = local.cloud_init_config
    ssh-keys  = "${var.ssh_user}:${var.ssh_public_key}"
  }

  service_account_id = data.yandex_iam_service_account.app_sa.id
}
