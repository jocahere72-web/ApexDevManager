###############################################################################
# Dev Environment - APEX Dev Manager
###############################################################################

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }
}

provider "oci" {
  region       = var.region
  tenancy_ocid = var.tenancy_ocid
}

###############################################################################
# Data Sources
###############################################################################

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "oci_core_images" "oke_node_images" {
  compartment_id           = var.compartment_id
  operating_system         = "Oracle Linux"
  operating_system_version = "8"
  shape                    = "VM.Standard.E4.Flex"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

###############################################################################
# Variables
###############################################################################

variable "tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "compartment_id" {
  description = "OCI compartment OCID"
  type        = string
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "us-ashburn-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "apexdev"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "db_admin_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT signing secret"
  type        = string
  sensitive   = true
}

variable "notification_email" {
  description = "Email for alerts"
  type        = string
}

variable "certificate_id" {
  description = "SSL certificate OCID"
  type        = string
  default     = ""
}

variable "repo_url" {
  description = "Source code repository URL"
  type        = string
  default     = ""
}

variable "tenancy_namespace" {
  description = "OCI tenancy namespace for OCIR"
  type        = string
  default     = ""
}

variable "external_connection_id" {
  description = "OCID of external connection for repo mirroring"
  type        = string
  default     = ""
}

###############################################################################
# Networking
###############################################################################

module "networking" {
  source = "../../modules/networking"

  compartment_id = var.compartment_id
  vcn_cidr       = "10.0.0.0/16"
  region         = var.region
  project_name   = var.project_name
  environment    = var.environment
}

###############################################################################
# OKE Cluster
###############################################################################

module "oke" {
  source = "../../modules/oke"

  compartment_id      = var.compartment_id
  vcn_id              = module.networking.vcn_id
  subnet_id           = module.networking.oke_subnet_id
  lb_subnet_id        = module.networking.public_subnet_id
  kubernetes_version  = "v1.28.2"
  node_shape          = "VM.Standard.E4.Flex"
  node_count          = 2
  node_ocpus          = 2
  node_memory_gb      = 16
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  node_image_id       = data.oci_core_images.oke_node_images.images[0].id
  nsg_ids             = [module.networking.nsg_ids["oke"]]
  project_name        = var.project_name
  environment         = var.environment
}

###############################################################################
# Database
###############################################################################

module "database" {
  source = "../../modules/database"

  compartment_id      = var.compartment_id
  subnet_id           = module.networking.db_subnet_id
  nsg_ids             = [module.networking.nsg_ids["db"]]
  db_name             = "apexdevdb"
  admin_password      = var.db_admin_password
  instance_ocpus      = 1
  instance_memory_gb  = 16
  storage_gb          = 50
  ha_enabled          = false
  backup_retention_days = 7
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  project_name        = var.project_name
  environment         = var.environment
}

###############################################################################
# Redis
###############################################################################

module "redis" {
  source = "../../modules/redis"

  compartment_id = var.compartment_id
  subnet_id      = module.networking.oke_subnet_id
  nsg_ids        = [module.networking.nsg_ids["redis"]]
  memory_gb      = 4
  node_count     = 1
  project_name   = var.project_name
  environment    = var.environment
}

###############################################################################
# Vault & Secrets
###############################################################################

module "vault" {
  source = "../../modules/vault"

  compartment_id = var.compartment_id
  db_password    = var.db_admin_password
  jwt_secret     = var.jwt_secret
  project_name   = var.project_name
  environment    = var.environment
}

###############################################################################
# Load Balancer
###############################################################################

module "load_balancer" {
  source = "../../modules/load-balancer"

  compartment_id = var.compartment_id
  subnet_id      = module.networking.public_subnet_id
  certificate_id = var.certificate_id
  min_bandwidth  = 10
  max_bandwidth  = 50
  project_name   = var.project_name
  environment    = var.environment
}

###############################################################################
# Logging & Monitoring
###############################################################################

module "logging" {
  source = "../../modules/logging"

  compartment_id     = var.compartment_id
  log_retention_days = 30
  alarm_threshold    = 10
  notification_email = var.notification_email
  project_name       = var.project_name
  environment        = var.environment
}

###############################################################################
# DevOps CI/CD
###############################################################################

module "devops" {
  source = "../../modules/devops"

  compartment_id         = var.compartment_id
  project_name           = var.project_name
  environment            = var.environment
  repo_url               = var.repo_url
  oke_cluster_id         = module.oke.cluster_id
  notification_topic_id  = module.logging.topic_id
  external_connection_id = var.external_connection_id
  region                 = var.region
  tenancy_namespace      = var.tenancy_namespace
}

###############################################################################
# Outputs
###############################################################################

output "vcn_id" {
  value = module.networking.vcn_id
}

output "oke_cluster_endpoint" {
  value = module.oke.cluster_endpoint
}

output "db_connection_string" {
  value     = module.database.connection_string
  sensitive = true
}

output "redis_endpoint" {
  value = module.redis.endpoint
}

output "lb_ip" {
  value = module.load_balancer.lb_ip
}

output "vault_id" {
  value = module.vault.vault_id
}
