resource "yandex_compute_disk" "data_disks" {
  count = 3
  size = 1
  type = "network-hdd"
  name = "data-disk-${count.index + 1}"
}

resource "yandex_compute_instance" "storage" {
  name = "netology-develop-platform-storage"
  platform_id = var.vm_storage_platform_id

  resources {
    cores = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.data_disks
    content {
      disk_id = secondary_disk.value.id
    } 
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }
}