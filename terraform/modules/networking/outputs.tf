output "vcn_id" {
  description = "The OCID of the VCN"
  value       = oci_core_vcn.main.id
}

output "public_subnet_id" {
  description = "The OCID of the public subnet (Load Balancer)"
  value       = oci_core_subnet.public.id
}

output "oke_subnet_id" {
  description = "The OCID of the private OKE subnet"
  value       = oci_core_subnet.oke.id
}

output "db_subnet_id" {
  description = "The OCID of the private database subnet"
  value       = oci_core_subnet.db.id
}

output "nsg_ids" {
  description = "Map of Network Security Group OCIDs"
  value = {
    oke   = oci_core_network_security_group.oke.id
    db    = oci_core_network_security_group.db.id
    redis = oci_core_network_security_group.redis.id
  }
}
