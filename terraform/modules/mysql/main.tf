resource "google_sql_database_instance" "sql" {
  region           = var.db_region
  database_version = "MYSQL_5_6"
  name             = var.db_name
  
  deletion_protection = false

  settings {
    tier              = var.db_tier
    availability_type = "ZONAL"

    ip_configuration {
      ipv4_enabled    = true
      require_ssl     = false
    }
  }
}

resource "google_sql_user" "sql_root" {
  name     = "root"
  host     = "%"
  password = var.database_root_password
  instance = google_sql_database_instance.sql.name
}

resource "google_sql_user" "sql_user" {
  name     = var.database_user
  host     = "%"
  password = var.database_password
  instance = google_sql_database_instance.sql.name
}

resource "google_sql_database" "db" {
  name      = var.database_name
  charset   = "utf8"
  instance  = google_sql_database_instance.sql.name
}
