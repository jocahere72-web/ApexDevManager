variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 30
}

variable "alarm_threshold" {
  description = "Error rate percentage threshold for triggering alarm"
  type        = number
  default     = 5
}

variable "notification_email" {
  description = "Email address for alarm notifications"
  type        = string
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
