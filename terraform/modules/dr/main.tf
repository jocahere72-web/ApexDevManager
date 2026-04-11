###############################################################################
# DR Module - Traffic Management Steering Policy & Health Check
###############################################################################

###############################################################################
# Health Check
###############################################################################

resource "oci_health_checks_http_monitor" "primary" {
  compartment_id      = var.compartment_id
  display_name        = "${var.project_name}-${var.environment}-primary-healthcheck"
  protocol            = "HTTPS"
  targets             = [var.primary_ip]
  port                = 443
  path                = var.health_check_path
  interval_in_seconds = var.health_check_interval
  timeout_in_seconds  = var.health_check_timeout
  method              = "GET"
  is_enabled          = true

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
    Role        = "primary"
  }
}

###############################################################################
# Traffic Management Steering Policy - Failover
###############################################################################

resource "oci_dns_steering_policy" "failover" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-${var.environment}-failover-policy"
  template       = "FAILOVER"
  ttl            = var.dns_ttl

  answers {
    name        = "primary"
    rdata       = var.primary_ip
    rtype       = "A"
    is_disabled = false
    pool        = "primary"
  }

  answers {
    name        = "standby"
    rdata       = var.standby_ip
    rtype       = "A"
    is_disabled = false
    pool        = "standby"
  }

  rules {
    rule_type = "FILTER"
  }

  rules {
    rule_type = "HEALTH"
  }

  rules {
    rule_type    = "PRIORITY"
    default_count = 1

    cases {
      case_condition = ""

      answer_data {
        answer_condition = "answer.pool == 'primary'"
        value            = 1
      }

      answer_data {
        answer_condition = "answer.pool == 'standby'"
        value            = 2
      }
    }
  }

  health_check_monitor_id = oci_health_checks_http_monitor.primary.id

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################################################
# Steering Policy Attachment
###############################################################################

resource "oci_dns_steering_policy_attachment" "main" {
  steering_policy_id = oci_dns_steering_policy.failover.id
  zone_id            = var.dns_zone_id
  domain_name        = var.domain_name
  display_name       = "${var.project_name}-${var.environment}-failover-attachment"
}
