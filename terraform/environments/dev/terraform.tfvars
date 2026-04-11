# Dev Environment - Minimal Resources
# NOTE: Sensitive values (db_admin_password, jwt_secret) should be provided
# via environment variables or a .tfvars file NOT checked into source control.

region       = "us-ashburn-1"
project_name = "apexdev"
environment  = "dev"

# Notification
notification_email = "dev-alerts@example.com"

# Repository
repo_url = "https://github.com/your-org/apex-dev-manager.git"
