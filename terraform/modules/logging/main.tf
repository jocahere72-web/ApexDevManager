###############################################################################
# Logging Module - Log Group, Custom Logs, Alarms, Notifications
###############################################################################

###############################################################################
# Log Group
###############################################################################

resource "oci_logging_log_group" "main" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-${var.environment}-logs"
  description    = "Log group for ${var.project_name} ${var.environment} environment"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################################################
# Custom Logs
###############################################################################

resource "oci_logging_log" "api" {
  display_name = "${var.project_name}-${var.environment}-api-log"
  log_group_id = oci_logging_log_group.main.id
  log_type     = "CUSTOM"
  is_enabled   = true

  retention_duration = var.log_retention_days

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
    LogSource   = "api"
  }
}

resource "oci_logging_log" "oke" {
  display_name = "${var.project_name}-${var.environment}-oke-log"
  log_group_id = oci_logging_log_group.main.id
  log_type     = "CUSTOM"
  is_enabled   = true

  retention_duration = var.log_retention_days

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
    LogSource   = "oke"
  }
}

###############################################################################
# Notification Topic
###############################################################################

resource "oci_ons_notification_topic" "alerts" {
  compartment_id = var.compartment_id
  name           = "${var.project_name}-${var.environment}-alerts"
  description    = "Alert notifications for ${var.project_name} ${var.environment}"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "oci_ons_subscription" "email" {
  compartment_id = var.compartment_id
  topic_id       = oci_ons_notification_topic.alerts.id
  endpoint       = var.notification_email
  protocol       = "EMAIL"
}

###############################################################################
# Monitoring Alarms
###############################################################################

resource "oci_monitoring_alarm" "error_rate" {
  compartment_id        = var.compartment_id
  display_name          = "${var.project_name}-${var.environment}-error-rate-alarm"
  is_enabled            = true
  metric_compartment_id = var.compartment_id
  namespace             = "custom_metrics"
  query                 = "ErrorRate[5m].mean() > ${var.alarm_threshold}"
  severity              = "CRITICAL"
  pending_duration      = "PT5M"
  body                  = "Error rate exceeded ${var.alarm_threshold}% in ${var.project_name} ${var.environment} environment."

  destinations = [oci_ons_notification_topic.alerts.id]

  message_format = "ONS_OPTIMIZED"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "oci_monitoring_alarm" "high_cpu" {
  compartment_id        = var.compartment_id
  display_name          = "${var.project_name}-${var.environment}-high-cpu-alarm"
  is_enabled            = true
  metric_compartment_id = var.compartment_id
  namespace             = "oci_computeagent"
  query                 = "CpuUtilization[5m].mean() > 85"
  severity              = "WARNING"
  pending_duration      = "PT10M"
  body                  = "CPU utilization exceeded 85% in ${var.project_name} ${var.environment} environment."

  destinations = [oci_ons_notification_topic.alerts.id]

  message_format = "ONS_OPTIMIZED"

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
