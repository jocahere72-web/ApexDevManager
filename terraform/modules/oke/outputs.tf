output "cluster_id" {
  description = "The OCID of the OKE cluster"
  value       = oci_containerengine_cluster.main.id
}

output "cluster_endpoint" {
  description = "The Kubernetes API endpoint of the OKE cluster"
  value       = oci_containerengine_cluster.main.endpoints[0].kubernetes
}

output "node_pool_id" {
  description = "The OCID of the node pool"
  value       = oci_containerengine_node_pool.main.id
}
