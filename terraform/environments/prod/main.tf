###############################################################################
# Prod Environment - APEX Dev Manager
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

variable "standby_region" {
  description = "Standby OCI region for DR"
  type        = string
  default     = "us-phoenix-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "apexdev"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
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
}

variable "repo_url" {
  description = "Source code repository URL"
  type        = string
}

variable "tenancy_namespace" {
  description = "OCI tenancy namespace for OCIR"
  type        = string
}

variable "external_connection_id" {
  description = "OCID of external connection for repo mirroring"
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "Domain name for production traffic management"
  type        = string
}

variable "dns_zone_id" {
  description = "OCID of the DNS zone"
  type        = string
}

variable "standby_lb_ip" {
  description = "IP address of the standby region load balancer"
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
# OKE Cluster - Production (3 nodes, higher resources)
###############################################################################

module "oke" {
  source = "../../modules/oke"

  compartment_id      = var.compartment_id
  vcn_id              = module.networking.vcn_id
  subnet_id           = module.networking.oke_subnet_id
  lb_subnet_id        = module.networking.public_subnet_id
  kubernetes_version  = "v1.28.2"
  node_shape          = "VM.Standard.E4.Flex"
  node_count          = 3
  node_ocpus          = 4
  node_memory_gb      = 32
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  node_image_id       = data.oci_core_images.oke_node_images.images[0].id
  nsg_ids             = [module.networking.nsg_ids["oke"]]
  project_name        = var.project_name
  environment         = var.environment
}

###############################################################################
# Database - Production (HA enabled, larger storage)
###############################################################################

module "database" {
  source = "../../modules/database"

  compartment_id      = var.compartment_id
  subnet_id           = module.networking.db_subnet_id
  nsg_ids             = [module.networking.nsg_ids["db"]]
  db_name             = "apexdevdb"
  db_credential_secret_id = module.vault.db_password_secret_id
  instance_ocpus      = 2
  instance_memory_gb  = 32
  storage_gb          = 100
  ha_enabled          = true
  backup_retention_days = 14
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  project_name        = var.project_name
  environment         = var.environment
}

###############################################################################
# Redis - Production (3-node cluster, more memory)
###############################################################################

module "redis" {
  source = "../../modules/redis"

  compartment_id = var.compartment_id
  subnet_id      = module.networking.oke_subnet_id
  nsg_ids        = [module.networking.nsg_ids["redis"]]
  memory_gb      = 8
  node_count     = 3
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
# Load Balancer - Production (higher bandwidth)
###############################################################################

module "load_balancer" {
  source = "../../modules/load-balancer"

  compartment_id = var.compartment_id
  subnet_id      = module.networking.public_subnet_id
  certificate_id = var.certificate_id
  min_bandwidth  = 100
  max_bandwidth  = 500
  waf_rate_limit = 1000
  project_name   = var.project_name
  environment    = var.environment
}

###############################################################################
# Logging & Monitoring - Production (longer retention, tighter thresholds)
###############################################################################

module "logging" {
  source = "../../modules/logging"

  compartment_id     = var.compartment_id
  log_retention_days = 90
  alarm_threshold    = 2
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
# DR - Traffic Management Failover
###############################################################################

module "dr" {
  source = "../../modules/dr"

  compartment_id = var.compartment_id
  primary_ip     = module.load_balancer.lb_ip
  standby_ip     = var.standby_lb_ip
  domain_name    = var.domain_name
  dns_zone_id    = var.dns_zone_id
  project_name   = var.project_name
  environment    = var.environment
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

output "steering_policy_id" {
  value = module.dr.steering_policy_id
}
