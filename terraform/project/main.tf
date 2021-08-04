provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "mysql" {
  source     = "../modules/mysql"
}

module "cluster" {
  source     = "../modules/cluster"
}

module "gcr" {
  source     = "../modules/gcr"
}
