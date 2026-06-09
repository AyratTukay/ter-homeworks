resource "yandex_compute_instance" "db" {
  for_each = {for i in var.each_vm : i.vm_name => i}
  name = "netology-develop-platform-db-${each.key}"
  platform_id = var.vm_db_platform_id
  resources {
    cores         = each.value.cores
    core_fraction = each.value.core_fraction
    memory          = each.value.ram
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
    }
  }  
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [ 
      yandex_vpc_security_group.example.id
    ]
  }
  metadata = var.metadata
}