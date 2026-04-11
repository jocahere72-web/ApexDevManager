variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "vault_name" {
  description = "Display name for the vault"
  type        = string
  default     = ""
}

variable "key_algorithm" {
  description = "Algorithm for the master encryption key"
  type        = string
  default     = "AES"
}

variable "key_length" {
  description = "Key length in bytes (16=128bit, 24=192bit, 32=256bit)"
  type        = number
  default     = 32
}

variable "db_password" {
  description = "Database password to store as a secret"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT signing secret to store"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
  default     = "apexdev"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
