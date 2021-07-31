variable "db_name" {
  description = "Name for database."
  type        = string
  default     = "sql-2"
}

variable "db_region" {
  description = "Region for database instance."
  type        = string
  default     = "europe-west3"
}

variable "db_tier" {
  description = "Tier for database instance."
  type        = string
  default     = "db-f1-micro"
}


variable "database_root_password" {
  type = string
  default = "thisIsA123PASS"
}

variable "database_user" {
  type = string
  default = "apiuser"
}

variable "database_password" {
  type = string
  default = "SecretPassword123!"
}

variable "database_name" {
  type = string
  default = "apidb"
}
