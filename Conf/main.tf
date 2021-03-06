provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_container_registry" "registry" {
  project     = var.project_id
  location    = "EU"
}

resource "random_id" "suffix" {
  byte_length = 4
}

module "init" {
  source     = "./modules/init" 
  project_id = var.project_id
  image_name = var.image_name
  tag        = var.tag 
  depends_on = [google_container_registry.registry]
}

module "network" {
  source          = "./modules/network/"
  region          = var.region
  project_id      = var.project_id
  network_name    = "${var.project_name}-vpc-${random_id.suffix.hex}-${terraform.workspace}"
  global_name     = "${var.network_global_address_name}-${random_id.suffix.hex}-${terraform.workspace}"
  subnetwork_name = "${var.project_name}-sub-${random_id.suffix.hex}-${terraform.workspace}"
}
  
module "sql" {
  source           = "./modules/sql"
  region           = var.region
  db_instance_name = "${var.project_name}-db-${random_id.suffix.hex}-${terraform.workspace}"
  db_tier          = var.db_tier
  private_network  = module.network.network_id
  db_root_password = var.db_root_password
  db_user          = var.db_user
  db_user_password = var.db_user_password
  depends_on       = [module.network]
}

module "cluster" {
  source                = "./modules/cluster/"
  region                = var.region
  project_id            = var.project_id
  cluster_name          = "${var.project_name}-cluster-${random_id.suffix.hex}-${terraform.workspace}"
  cluster_nodepool_name = "${var.project_name}-nodepool-${random_id.suffix.hex}-${terraform.workspace}"
  network               = module.network.network_name
  subnetwork            = module.network.subnetwork_name
  machine_type          = var.node_machine_type
  depends_on            = [module.sql, module.network]
}


module "kubernetes" {
  source                 = "./modules/kuber" 
  endpoint               = module.cluster.public_endpoint
  cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
  secret_name            = var.kubernetes_secret_name
  db_host                = module.sql.db_private_ip_address
  db_user                = var.db_user
  db_user_password       = var.db_user_password
  db_name                = var.db_name
}

module "helm" {
  source                 = "./modules/helm"
  endpoint               = module.cluster.public_endpoint
  cluster_ca_certificate = base64decode(module.cluster.cluster_ca_certificate)
  helm_name              = "${module.cluster.cluster_name}"
  chart_path             = var.gh_token
}
