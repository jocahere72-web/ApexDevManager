variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "project_name" {
  description = "Project name for DevOps project naming"
  type        = string
  default     = "apexdev"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "repo_url" {
  description = "URL of the source code repository"
  type        = string
}

variable "oke_cluster_id" {
  description = "OCID of the target OKE cluster"
  type        = string
}

variable "notification_topic_id" {
  description = "OCID of the notification topic for DevOps events"
  type        = string
}

variable "external_connection_id" {
  description = "OCID of the external connection for repository mirroring"
  type        = string
  default     = ""
}

variable "build_branch" {
  description = "Branch to trigger builds on"
  type        = string
  default     = "main"
}

variable "build_spec_file" {
  description = "Path to the build spec file in the repository"
  type        = string
  default     = "build_spec.yaml"
}

variable "region" {
  description = "OCI region for OCIR registry URL"
  type        = string
  default     = "us-ashburn-1"
}

variable "tenancy_namespace" {
  description = "OCI tenancy namespace for OCIR"
  type        = string
  default     = ""
}

variable "kubernetes_manifest_content" {
  description = "Kubernetes deployment manifest content"
  type        = string
  default     = ""
}
