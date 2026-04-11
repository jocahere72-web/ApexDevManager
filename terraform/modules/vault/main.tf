###############################################################################
# Vault Module - OCI Vault, Master Key, and Secrets
###############################################################################

resource "oci_kms_vault" "main" {
  compartment_id = var.compartment_id
  display_name   = var.vault_name != "" ? var.vault_name : "${var.project_name}-${var.environment}-vault"
  vault_type     = "DEFAULT"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "oci_kms_key" "master" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-${var.environment}-master-key"
  management_endpoint = oci_kms_vault.main.management_endpoint

  key_shape {
    algorithm = var.key_algorithm
    length    = var.key_length
  }

  protection_mode = "HSM"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################################################
# Secrets
###############################################################################

resource "oci_vault_secret" "db_password" {
  compartment_id = var.compartment_id
  vault_id       = oci_kms_vault.main.id
  key_id         = oci_kms_key.master.id
  secret_name    = "${var.project_name}-${var.environment}-db-password"

  secret_content {
    content_type = "BASE64"
    content      = base64encode(var.db_password)
  }

  description = "Database admin password for ${var.project_name} ${var.environment}"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
    SecretType  = "database"
  }
}

resource "oci_vault_secret" "jwt_secret" {
  compartment_id = var.compartment_id
  vault_id       = oci_kms_vault.main.id
  key_id         = oci_kms_key.master.id
  secret_name    = "${var.project_name}-${var.environment}-jwt-secret"

  secret_content {
    content_type = "BASE64"
    content      = base64encode(var.jwt_secret)
  }

  description = "JWT signing secret for ${var.project_name} ${var.environment}"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
    SecretType  = "jwt"
  }
}
