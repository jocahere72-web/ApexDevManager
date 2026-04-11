output "steering_policy_id" {
  description = "The OCID of the traffic management steering policy"
  value       = oci_dns_steering_policy.failover.id
}

output "health_check_id" {
  description = "The OCID of the HTTP health check monitor"
  value       = oci_health_checks_http_monitor.primary.id
}
