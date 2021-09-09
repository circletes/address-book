variable "project_id" {
  description = "Google Cloud Platform (GCP) Project ID."
  type        = string
  default     = "citric-earth-319117"
}

variable "region" {
  description = "GCP region name."
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "GCP zone name."
  type        = string
  default     = "europe-west3-c"
}

variable "project_name" {
  description = "Google Cloud Platform (GCP) Project name."
  type        = string
  default     = "my-first"
}

variable "network_global_address_name" {
  description = "Address name for private network."
  type        = string
  default     = "private-ip-address"
}


variable "db_name" {
  description = "Name for database."
  type        = string
  default     = "web-db"
}

variable "db_region" {
  description = "Region for database."
  type        = string
  default     = "europe-central2"
}

variable "db_tier" {
  description = "Tier for database."
  type        = string
  default     = "db-f1-micro"
}

variable "db_root_password" {
}

variable "db_user" {
}

variable "db_user_password" {
}


variable "node_machine_type"{
  description = "Machine type for kubernetes node."
  type        = string
  default     = "e2-micro"
}


variable "image_name"{
  description = "Initial image name for docker."
  type        = string
  default     = "address-book"
}

variable "tag"{
  description = "Initial tag for docker image."
  type        = string
  default     = "init"
}


variable "kubernetes_secret_name" {
  description = "Name for kubernetes secrets."
  type        = string
  default     = "db-secrets"
}


variable "chart_path" {  
  description = "Path for helm chart."
  type        = string
  default     = ""
}

variable "gh_token"{
}
