###############################################################################
# Redis Module - OCI Cache with Redis
###############################################################################

resource "oci_redis_redis_cluster" "main" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-${var.environment}-redis"

  node_count        = var.node_count
  node_memory_in_gbs = var.memory_gb
  software_version  = var.redis_version
  subnet_id         = var.subnet_id
  nsg_ids           = var.nsg_ids

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
