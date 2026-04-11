variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "primary_ip" {
  description = "IP address of the primary region load balancer"
  type        = string
}

variable "standby_ip" {
  description = "IP address of the standby region load balancer"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the steering policy"
  type        = string
}

variable "dns_zone_id" {
  description = "OCID of the DNS zone"
  type        = string
}

variable "health_check_path" {
  description = "URL path for the health check"
  type        = string
  default     = "/health"
}

variable "health_check_interval" {
  description = "Health check interval in seconds"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Health check timeout in seconds"
  type        = number
  default     = 10
}

variable "dns_ttl" {
  description = "TTL for DNS records in seconds"
  type        = number
  default     = 60
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
