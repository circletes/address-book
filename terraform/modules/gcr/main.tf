
resource "google_container_registry" "registry" {
  project  = var.project_id
  location = var.location
}

resource "google_storage_bucket_iam_member" "container_registry_access" {
  bucket =  google_container_registry.registry.id
  role   = "roles/storage.admin"
  member = "serviceAccount:home-895@citric-earth-319117.iam.gserviceaccount.com"
}
