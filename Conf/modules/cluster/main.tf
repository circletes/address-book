resource "google_container_cluster" "test" {
  name     = var.cluster_name
  location = var.region
  
  remove_default_node_pool = true
  initial_node_count       = 1

  network         = var.network
  subnetwork      = var.subnetwork
  networking_mode = "VPC_NATIVE"
  
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/20"
    services_ipv4_cidr_block = "/20"
  }
}

resource "google_container_node_pool" "test_nodes" {
  name       = var.cluster_nodepool_name
  location   = var.region
  cluster    = google_container_cluster.test.name
  node_count = 1

  node_config {
    preemptible  = true
    oauth_scopes = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring"
   ]
    machine_type = var.machine_type
    tags         = ["gke-node"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
