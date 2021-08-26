provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_storage_bucket" "bucket" {
  name    = var.name
  project = var.project_id

  versioning {
    enabled = var.versioning
  }
}

