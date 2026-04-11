output "project_id" {
  description = "The OCID of the DevOps project"
  value       = oci_devops_project.main.id
}

output "build_pipeline_id" {
  description = "The OCID of the build pipeline"
  value       = oci_devops_build_pipeline.main.id
}

output "deploy_pipeline_id" {
  description = "The OCID of the deploy pipeline"
  value       = oci_devops_deploy_pipeline.main.id
}
