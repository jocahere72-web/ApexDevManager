variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the private subnet for Redis"
  type        = string
}

variable "nsg_ids" {
  description = "List of NSG OCIDs for Redis"
  type        = list(string)
  default     = []
}

variable "memory_gb" {
  description = "Memory in GB per Redis node"
  type        = number
  default     = 8
}

variable "node_count" {
  description = "Number of Redis nodes in the cluster"
  type        = number
  default     = 3
}

variable "redis_version" {
  description = "Redis software version"
  type        = string
  default     = "V7_0_5"
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
