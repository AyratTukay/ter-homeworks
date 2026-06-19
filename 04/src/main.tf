#создаем облачную сеть
/*resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
#создаем подсеть
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
*/

module "vpc" {
  source    = "./vpc"
  vpc_name  = "develop"
  default_zone  = "ru-central1-a"
  default_cidr  = var.default_cidr
}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
#  network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.vpc_id
  subnet_zones   = ["ru-central1-a"]
#  subnet_ids     = [yandex_vpc_subnet.develop.id]
  subnet_ids     = [module.vpc.subnet_id]
  instance_name  = "webs"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "ar.tukaev",
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
#  network_id     = yandex_vpc_network.develop.id
  network_id     = module.vpc.vpc_id
  subnet_zones   = ["ru-central1-a"]
#  subnet_ids     = [yandex_vpc_subnet.develop.id]
  subnet_ids     = [module.vpc.subnet_id]
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "a.tukaev",
    project = "analytics"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key  = var.vms_ssh_root_key
  }
}

