output "network_id"{
  value = google_compute_network.network.id 
}

output "network_name"{
  value = google_compute_network.network.name 
}

output "subnetwork_name" {
  value = google_compute_subnetwork.subnet.name
}
