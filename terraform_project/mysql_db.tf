resource "yandex_mdb_mysql_cluster" "my_mysql" {
  name                = "my_mysql_cluster"
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

resource "yandex_mdb_mysql_database" "db1" {
  cluster_id = yandex_mdb_mysql_cluster.my_mysql.id
  name       = "db1"
}

resource "yandex_mdb_mysql_user" "user-db" {
  cluster_id = yandex_mdb_mysql_cluster.my_mysql.id
  name       = "user-db"
  password   = "passwd_db"
  permission {
    database_name = yandex_mdb_mysql_database.db1.name
    roles         = ["ALL"]
  }
}
