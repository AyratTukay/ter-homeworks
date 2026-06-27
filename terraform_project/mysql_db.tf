resource "yandex_mdb_mysql_cluster" "my_mysql" {
  name                = "${var.vm_name}-mysql"
  environment         = "PRESTABLE"
  network_id          = module.vpc.vpc_id
  version             = var.db_version
  security_group_ids  = [yandex_vpc_security_group.example.id]

  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = var.db_disk_type
    disk_size          = var.db_disk_size
  }

  host {
    zone             = var.default_zone
    subnet_id        = module.vpc.subnet_id
  }
}

resource "yandex_mdb_mysql_database" "app_database" {
  cluster_id = yandex_mdb_mysql_cluster.my_mysql.id
  name       = "app_database"
}

resource "yandex_mdb_mysql_user" "app_user" {
  cluster_id = yandex_mdb_mysql_cluster.my_mysql.id
  name       = "app_user"
  password   = var.db_password
  permission {
    database_name = "app_database"
    roles         = ["ALL"]
  }
}


output "db_host" {
  description = "MySQL host FQDN"
  value       = yandex_mdb_mysql_cluster.my_mysql.host[0].fqdn
}