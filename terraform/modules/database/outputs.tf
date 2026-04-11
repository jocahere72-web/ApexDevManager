output "db_id" {
  description = "The OCID of the PostgreSQL database system"
  value       = oci_psql_db_system.main.id
}

output "connection_string" {
  description = "PostgreSQL connection string"
  value       = "postgresql://${var.admin_username}@${oci_psql_db_system.main.network_details[0].primary_db_endpoint_private_ip}:5432/${var.db_name}"
  sensitive   = true
}

output "ip_address" {
  description = "Private IP address of the primary database instance"
  value       = oci_psql_db_system.main.network_details[0].primary_db_endpoint_private_ip
}
