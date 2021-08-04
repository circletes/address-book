variable "name" {
  type        = string
  default     = "my-gke-cluster"
}

variable "location" {
  type        = string
  default     = "europe-west3"
}

variable "machine_type" {
  type = string
  default = "n1-standard-2"
}

variable "service_account" {
  type = string
  default = "home-895@citric-earth-319117.iam.gserviceaccount.com"
}

variable "google_container_node_pool_name" {
  type = string
  default = "my-node-pool"
}
