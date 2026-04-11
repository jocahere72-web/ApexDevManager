output "log_group_id" {
  description = "The OCID of the log group"
  value       = oci_logging_log_group.main.id
}

output "topic_id" {
  description = "The OCID of the notification topic"
  value       = oci_ons_notification_topic.alerts.id
}
