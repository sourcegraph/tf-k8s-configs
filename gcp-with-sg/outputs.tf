output "cluster_id" {
  value       = module.gke.name
  description = "GKE Cluster ID"
}

output "region" {
  value       = module.gke.region
  description = "The GCP region the cluster is deployed into"
}
