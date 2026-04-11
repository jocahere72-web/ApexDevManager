variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the private subnet for the database"
  type        = string
}

variable "nsg_ids" {
  description = "List of NSG OCIDs for the database"
  type        = list(string)
  default     = []
}

variable "db_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "apexdevdb"
}

variable "db_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "14"
}

variable "admin_username" {
  description = "Database admin username"
  type        = string
  default     = "apexadmin"
}

variable "db_credential_secret_id" {
  description = "OCID of the OCI Vault secret containing the database admin credential"
  type        = string
}

variable "db_credential_secret_version" {
  description = "Version of the OCI Vault secret"
  type        = string
  default     = "1"
}

variable "shape" {
  description = "Database system shape"
  type        = string
  default     = "PostgreSQL.VM.Standard.E4.Flex.2.32GB"
}

variable "instance_ocpus" {
  description = "OCPUs per database instance"
  type        = number
  default     = 2
}

variable "instance_memory_gb" {
  description = "Memory in GB per database instance"
  type        = number
  default     = 32
}

variable "storage_gb" {
  description = "Storage size in GB"
  type        = number
  default     = 50
}

variable "ha_enabled" {
  description = "Enable high availability (multi-instance)"
  type        = bool
  default     = true
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "availability_domain" {
  description = "Availability domain for the database"
  type        = string
}

variable "db_config_id" {
  description = "OCID of the database configuration"
  type        = string
  default     = ""
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
