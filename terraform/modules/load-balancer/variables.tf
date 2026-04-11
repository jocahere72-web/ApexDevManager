variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the public subnet for the load balancer"
  type        = string
}

variable "nsg_ids" {
  description = "List of NSG OCIDs for the load balancer"
  type        = list(string)
  default     = []
}

variable "certificate_id" {
  description = "OCID of the SSL certificate for HTTPS listener"
  type        = string
}

variable "min_bandwidth" {
  description = "Minimum bandwidth in Mbps for flexible LB"
  type        = number
  default     = 10
}

variable "max_bandwidth" {
  description = "Maximum bandwidth in Mbps for flexible LB"
  type        = number
  default     = 100
}

variable "health_check_port" {
  description = "Port for backend health checks"
  type        = number
  default     = 30080
}

variable "health_check_path" {
  description = "URL path for health check endpoint"
  type        = string
  default     = "/health"
}

variable "waf_rate_limit" {
  description = "Maximum requests per minute before rate limiting"
  type        = number
  default     = 300
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
