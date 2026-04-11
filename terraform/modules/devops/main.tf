###############################################################################
# DevOps Module - OCI DevOps Project, Build & Deploy Pipelines
###############################################################################

###############################################################################
# DevOps Project
###############################################################################

resource "oci_devops_project" "main" {
  compartment_id = var.compartment_id
  name           = "${var.project_name}-${var.environment}"
  description    = "DevOps project for ${var.project_name} ${var.environment}"

  notification_config {
    topic_id = var.notification_topic_id
  }

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################################################
# Code Repository (Mirror)
###############################################################################

resource "oci_devops_repository" "main" {
  project_id     = oci_devops_project.main.id
  name           = "${var.project_name}-repo"
  repository_type = "MIRRORED"
  description    = "Mirrored repository for ${var.project_name}"

  mirror_repository_config {
    connector_id   = var.external_connection_id
    repository_url = var.repo_url

    trigger_schedule {
      schedule_type = "DEFAULT"
    }
  }
}

###############################################################################
# Build Pipeline
###############################################################################

resource "oci_devops_build_pipeline" "main" {
  project_id   = oci_devops_project.main.id
  display_name = "${var.project_name}-${var.environment}-build"
  description  = "Build pipeline for ${var.project_name} ${var.environment}"

  build_pipeline_parameters {
    items {
      name          = "ENVIRONMENT"
      default_value = var.environment
      description   = "Target deployment environment"
    }
    items {
      name          = "OKE_CLUSTER_ID"
      default_value = var.oke_cluster_id
      description   = "Target OKE cluster OCID"
    }
  }

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################################################
# Build Pipeline Stages
###############################################################################

resource "oci_devops_build_pipeline_stage" "build" {
  build_pipeline_id = oci_devops_build_pipeline.main.id
  display_name      = "build-stage"
  description       = "Build application container images"

  build_pipeline_stage_type = "BUILD"

  build_runner_shape_config {
    build_runner_type = "DEFAULT"
  }

  build_source_collection {
    items {
      connection_type = "DEVOPS_CODE_REPOSITORY"
      repository_id   = oci_devops_repository.main.id
      repository_url  = var.repo_url
      branch          = var.build_branch
      name            = var.project_name
    }
  }

  build_spec_file = var.build_spec_file

  build_pipeline_stage_predecessor_collection {
    items {
      id = oci_devops_build_pipeline.main.id
    }
  }

  image = "OL7_X86_64_STANDARD_10"
}

resource "oci_devops_build_pipeline_stage" "deliver" {
  build_pipeline_id = oci_devops_build_pipeline.main.id
  display_name      = "deliver-artifacts"
  description       = "Deliver container images to OCIR"

  build_pipeline_stage_type = "DELIVER_ARTIFACT"

  deliver_artifact_collection {
    items {
      artifact_id   = oci_devops_deploy_artifact.container_image.id
      artifact_name = "${var.project_name}-image"
    }
  }

  build_pipeline_stage_predecessor_collection {
    items {
      id = oci_devops_build_pipeline_stage.build.id
    }
  }
}

###############################################################################
# Build Trigger
###############################################################################

resource "oci_devops_trigger" "push_to_main" {
  project_id   = oci_devops_project.main.id
  display_name = "${var.project_name}-${var.environment}-trigger"
  trigger_source = "DEVOPS_CODE_REPOSITORY"
  repository_id  = oci_devops_repository.main.id
  description    = "Trigger build on push to ${var.build_branch}"

  actions {
    build_pipeline_id = oci_devops_build_pipeline.main.id
    type              = "TRIGGER_BUILD_PIPELINE"

    filter {
      trigger_source = "DEVOPS_CODE_REPOSITORY"
      events         = ["PUSH"]

      include {
        head_ref = var.build_branch
      }
    }
  }
}

###############################################################################
# Deploy Artifacts
###############################################################################

resource "oci_devops_deploy_artifact" "container_image" {
  project_id                = oci_devops_project.main.id
  display_name              = "${var.project_name}-container-image"
  deploy_artifact_type      = "DOCKER_IMAGE"
  argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"

  deploy_artifact_source {
    deploy_artifact_source_type = "OCIR"
    image_uri                   = "${var.region}.ocir.io/${var.tenancy_namespace}/${var.project_name}:$${BUILDRUN_HASH}"
    image_digest                = " "
  }
}

resource "oci_devops_deploy_artifact" "kubernetes_manifest" {
  project_id                = oci_devops_project.main.id
  display_name              = "${var.project_name}-k8s-manifest"
  deploy_artifact_type      = "KUBERNETES_MANIFEST"
  argument_substitution_mode = "SUBSTITUTE_PLACEHOLDERS"

  deploy_artifact_source {
    deploy_artifact_source_type = "INLINE"
    base64encoded_content       = base64encode(var.kubernetes_manifest_content)
  }
}

###############################################################################
# Deploy Pipeline
###############################################################################

resource "oci_devops_deploy_pipeline" "main" {
  project_id   = oci_devops_project.main.id
  display_name = "${var.project_name}-${var.environment}-deploy"
  description  = "Deploy pipeline for ${var.project_name} to OKE"

  deploy_pipeline_parameters {
    items {
      name          = "ENVIRONMENT"
      default_value = var.environment
      description   = "Target deployment environment"
    }
  }

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################################################
# Deploy Pipeline Stage - Deploy to OKE
###############################################################################

resource "oci_devops_deploy_stage" "oke_deploy" {
  deploy_pipeline_id = oci_devops_deploy_pipeline.main.id
  display_name       = "deploy-to-oke"
  description        = "Deploy application to OKE cluster"

  deploy_stage_type = "OKE_DEPLOYMENT"

  oke_cluster_deploy_environment_id = oci_devops_deploy_environment.oke.id

  kubernetes_manifest_deploy_artifact_ids = [
    oci_devops_deploy_artifact.kubernetes_manifest.id
  ]

  rollback_policy {
    policy_type = "AUTOMATED_STAGE_ROLLBACK_POLICY"
  }

  deploy_stage_predecessor_collection {
    items {
      id = oci_devops_deploy_pipeline.main.id
    }
  }
}

###############################################################################
# Deploy Environment - OKE Cluster
###############################################################################

resource "oci_devops_deploy_environment" "oke" {
  project_id              = oci_devops_project.main.id
  display_name            = "${var.project_name}-${var.environment}-oke-env"
  deploy_environment_type = "OKE_CLUSTER"
  cluster_id              = var.oke_cluster_id
  description             = "OKE cluster environment for ${var.project_name} ${var.environment}"
}
