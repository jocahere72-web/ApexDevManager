###############################################################################
# OKE Module - Kubernetes Cluster and Node Pool
###############################################################################

resource "oci_containerengine_cluster" "main" {
  compartment_id     = var.compartment_id
  kubernetes_version = var.kubernetes_version
  name               = "${var.project_name}-${var.environment}-oke"
  vcn_id             = var.vcn_id

  cluster_pod_network_options {
    cni_type = "FLANNEL_OVERLAY"
  }

  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = var.subnet_id
    nsg_ids              = var.nsg_ids
  }

  options {
    service_lb_subnet_ids = [var.lb_subnet_id]

    add_ons {
      is_kubernetes_dashboard_enabled = false
      is_tiller_enabled               = false
    }

    admission_controller_options {
      is_pod_security_policy_enabled = false
    }
  }

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "oci_containerengine_node_pool" "main" {
  compartment_id     = var.compartment_id
  cluster_id         = oci_containerengine_cluster.main.id
  kubernetes_version = var.kubernetes_version
  name               = "${var.project_name}-${var.environment}-nodepool"

  node_shape = var.node_shape

  node_shape_config {
    ocpus         = var.node_ocpus
    memory_in_gbs = var.node_memory_gb
  }

  node_config_details {
    size = var.node_count

    placement_configs {
      availability_domain = var.availability_domain
      subnet_id           = var.subnet_id
    }

    nsg_ids = var.nsg_ids

    freeform_tags = {
      Project     = var.project_name
      Environment = var.environment
    }
  }

  node_source_details {
    image_id    = var.node_image_id
    source_type = "IMAGE"
  }

  initial_node_labels {
    key   = "app"
    value = var.project_name
  }

  initial_node_labels {
    key   = "environment"
    value = var.environment
  }
}
