provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "firewall_rule" {
  source     = "../modules/firewall_rule"
}

module "mysql" {
  source     = "../modules/mysql"
}

module "cluster" {
  source     = "../modules/cluster"
}
