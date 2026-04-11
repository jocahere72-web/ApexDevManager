###############################################################################
# Backend Configuration - OCI Object Storage
###############################################################################

terraform {
  backend "s3" {
    bucket                      = "apexdev-terraform-state-dev"
    key                         = "dev/terraform.tfstate"
    region                      = "us-ashburn-1"
    endpoint                    = "https://<tenancy_namespace>.compat.objectstorage.us-ashburn-1.oraclecloud.com"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
