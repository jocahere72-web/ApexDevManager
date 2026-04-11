output "redis_id" {
  description = "The OCID of the Redis cluster"
  value       = oci_redis_redis_cluster.main.id
}

output "endpoint" {
  description = "Primary endpoint of the Redis cluster"
  value       = oci_redis_redis_cluster.main.primary_endpoint_ip_address
}

output "port" {
  description = "Port of the Redis cluster"
  value       = 6379
}
