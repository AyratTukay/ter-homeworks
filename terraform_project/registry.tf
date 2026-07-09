resource "yandex_container_registry" "app_registry" {
  name      = "${var.vm_name}-registry"
  registry_id = var.my_registry_id
}

output "registry_id" {
  value = yandex_container_registry.app_registry.id
}