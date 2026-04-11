variable "compartment_id" {
  description = "The OCID of the compartment"
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN"
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the private subnet for OKE nodes"
  type        = string
}

variable "lb_subnet_id" {
  description = "The OCID of the public subnet for service load balancers"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the OKE cluster"
  type        = string
  default     = "v1.28.2"
}

variable "node_shape" {
  description = "Shape for the OKE worker nodes"
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
  default     = 3
}

variable "node_ocpus" {
  description = "Number of OCPUs per node"
  type        = number
  default     = 2
}

variable "node_memory_gb" {
  description = "Memory in GB per node"
  type        = number
  default     = 16
}

variable "availability_domain" {
  description = "Availability domain for node placement"
  type        = string
}

variable "node_image_id" {
  description = "OCID of the node image (Oracle Linux)"
  type        = string
}

variable "nsg_ids" {
  description = "List of NSG OCIDs to attach to cluster and nodes"
  type        = list(string)
  default     = []
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
