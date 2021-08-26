output "db_private_ip_address" {
  value    = google_sql_database_instance.sql.private_ip_address
}