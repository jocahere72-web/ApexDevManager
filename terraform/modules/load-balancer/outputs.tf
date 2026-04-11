output "lb_id" {
  description = "The OCID of the load balancer"
  value       = oci_load_balancer_load_balancer.main.id
}

output "lb_ip" {
  description = "Public IP address of the load balancer"
  value       = oci_load_balancer_load_balancer.main.ip_address_details[0].ip_address
}
