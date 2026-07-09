resource "yandex_mdb_mysql_cluster" "app_db_cluster" {
  name        = "app-mysql-cluster"
  environment = "PRESTABLE" 

  network_id  = module.vpc.vpc_id 

  version     = var.db_version

  resources {
    resource_preset_id = "s2.micro" 
    disk_type_id       = var.db_disk_type
    disk_size          = var.db_disk_size
  }

  host {
    zone      = var.default_zone
    subnet_id = module.vpc.subnet_id 
  }
  security_group_ids = [yandex_vpc_security_group.example.id]
}

resource "yandex_mdb_mysql_database" "app_database" {
  cluster_id = yandex_mdb_mysql_cluster.app_db_cluster.id
  name       = "app_database"
}

resource "yandex_mdb_mysql_user" "app_user" {
  cluster_id = yandex_mdb_mysql_cluster.app_db_cluster.id
  name       = "app_user"
  password   = var.db_password
  permission {
    database_name = "app_database"
    roles         = ["ALL"]
  }
}
