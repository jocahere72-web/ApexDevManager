# Prod Environment - Full HA Resources
# NOTE: Sensitive values (db_admin_password, jwt_secret) should be provided
# via environment variables or a .tfvars file NOT checked into source control.

region         = "us-ashburn-1"
standby_region = "us-phoenix-1"
project_name   = "apexdev"
environment    = "prod"

# Notification
notification_email = "prod-alerts@example.com"

# Domain & DNS
domain_name = "apexdev.example.com"

# Repository
repo_url = "https://github.com/your-org/apex-dev-manager.git"
