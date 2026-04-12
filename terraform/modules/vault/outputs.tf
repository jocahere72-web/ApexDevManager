output "vault_id" {
  description = "The OCID of the vault"
  value       = oci_kms_vault.main.id
}

output "key_id" {
  description = "The OCID of the master encryption key"
  value       = oci_kms_key.master.id
}

output "db_password_secret_id" {
  description = "The OCID of the database password secret"
  value       = oci_vault_secret.db_password.id
}
