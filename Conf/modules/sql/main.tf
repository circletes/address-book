resource "google_sql_database_instance" "sql" {
  region           = var.region
  database_version = "MYSQL_5_6"
  name             = var.db_instance_name

  settings {
    tier = var.db_tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network
    }
  }
  deletion_protection = false
}

resource "google_sql_user" "master" {
  name     = "root"
  host     = "%"
  password = var.db_root_password
  instance = google_sql_database_instance.sql.name
}

resource "google_sql_user" "sql_user" {
  name     = var.db_user
  host     = "%"
  password = var.db_user_password
  instance = google_sql_database_instance.sql.name
}
