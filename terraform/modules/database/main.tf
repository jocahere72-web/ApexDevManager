###############################################################################
# Database Module - OCI Database Service PostgreSQL
###############################################################################

resource "oci_psql_db_system" "main" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-${var.environment}-postgres"
  db_version     = var.db_version

  shape = var.shape

  instance_count        = var.ha_enabled ? 2 : 1
  instance_ocpu_count   = var.instance_ocpus
  instance_memory_size_in_gbs = var.instance_memory_gb

  storage_details {
    system_type               = "OCI_OPTIMIZED_STORAGE"
    is_regionally_durable     = var.ha_enabled
    availability_domain       = var.availability_domain
  }

  network_details {
    subnet_id = var.subnet_id
    nsg_ids   = var.nsg_ids
  }

  db_configuration_params {
    apply_config = "RESTART"
    config_id    = var.db_config_id
  }

  credentials {
    username      = var.admin_username
    secret_id     = var.db_credential_secret_id
    secret_version = var.db_credential_secret_version
  }

  management_policy {
    backup_policy {
      kind              = "DAILY"
      retention_days    = var.backup_retention_days
      backup_start      = "02:00"
    }
    maintenance_window_start = "SUN 04:00"
  }

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
