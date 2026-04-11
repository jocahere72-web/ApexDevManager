###############################################################################
# Load Balancer Module - Flexible LB with WAF
###############################################################################

resource "oci_load_balancer_load_balancer" "main" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-${var.environment}-lb"
  shape          = "flexible"

  shape_details {
    minimum_bandwidth_in_mbps = var.min_bandwidth
    maximum_bandwidth_in_mbps = var.max_bandwidth
  }

  subnet_ids = [var.subnet_id]

  is_private = false

  nsg_ids = var.nsg_ids

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

###############################################################################
# Backend Set
###############################################################################

resource "oci_load_balancer_backend_set" "oke_nodeport" {
  load_balancer_id = oci_load_balancer_load_balancer.main.id
  name             = "oke-nodeport-backendset"
  policy           = "ROUND_ROBIN"

  health_checker {
    protocol            = "HTTP"
    port                = var.health_check_port
    url_path            = var.health_check_path
    return_code         = 200
    interval_ms         = 10000
    timeout_in_millis   = 3000
    retries             = 3
  }

  session_persistence_configuration {
    cookie_name      = "lb-session"
    disable_fallback = false
  }
}

###############################################################################
# HTTP Listener (port 80) - Redirect to HTTPS
###############################################################################

resource "oci_load_balancer_listener" "http" {
  load_balancer_id         = oci_load_balancer_load_balancer.main.id
  name                     = "http-listener"
  default_backend_set_name = oci_load_balancer_backend_set.oke_nodeport.name
  port                     = 80
  protocol                 = "HTTP"

  connection_configuration {
    idle_timeout_in_seconds = 300
  }

  rule_set_names = [oci_load_balancer_rule_set.redirect_to_https.name]
}

resource "oci_load_balancer_rule_set" "redirect_to_https" {
  load_balancer_id = oci_load_balancer_load_balancer.main.id
  name             = "redirect-to-https"

  items {
    action = "REDIRECT"

    conditions {
      attribute_name  = "PATH"
      attribute_value = "/"
      operator        = "FORCE_LONGEST_PREFIX_MATCH"
    }

    redirect_uri {
      protocol = "HTTPS"
      port     = 443
    }

    response_code = 301
  }
}

###############################################################################
# HTTPS Listener (port 443)
###############################################################################

resource "oci_load_balancer_listener" "https" {
  load_balancer_id         = oci_load_balancer_load_balancer.main.id
  name                     = "https-listener"
  default_backend_set_name = oci_load_balancer_backend_set.oke_nodeport.name
  port                     = 443
  protocol                 = "HTTP"

  ssl_configuration {
    certificate_ids                = [var.certificate_id]
    verify_peer_certificate        = false
    protocols                      = ["TLSv1.2", "TLSv1.3"]
    cipher_suite_name              = "oci-wider-compatible-ssl-cipher-suite-v1"
  }

  connection_configuration {
    idle_timeout_in_seconds = 300
  }
}

###############################################################################
# WAF Policy
###############################################################################

resource "oci_waf_web_app_firewall_policy" "main" {
  compartment_id = var.compartment_id
  display_name   = "${var.project_name}-${var.environment}-waf-policy"

  actions {
    name = "allowAction"
    type = "ALLOW"
  }

  actions {
    name = "checkAction"
    type = "CHECK"
  }

  actions {
    name = "return403"
    type = "RETURN_HTTP_RESPONSE"
    code = 403
    body {
      type = "STATIC_TEXT"
      text = "Access Denied"
    }
    headers {
      name  = "Content-Type"
      value = "text/plain"
    }
  }

  request_protection {
    rules {
      name                       = "owasp-protection"
      type                       = "PROTECTION"
      action_name                = "return403"
      is_body_inspection_enabled = true
      condition                  = ""

      protection_capabilities {
        key     = "920360"
        version = 1
      }
    }
  }

  request_rate_limiting {
    rules {
      name        = "rate-limit"
      type        = "RATE_LIMITING"
      action_name = "return403"
      condition   = ""

      configurations {
        period_in_seconds          = 60
        requests_limit             = var.waf_rate_limit
        action_duration_in_seconds = 600
      }
    }
  }

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "oci_waf_web_app_firewall" "main" {
  compartment_id             = var.compartment_id
  display_name               = "${var.project_name}-${var.environment}-waf"
  backend_type               = "LOAD_BALANCER"
  load_balancer_id           = oci_load_balancer_load_balancer.main.id
  web_app_firewall_policy_id = oci_waf_web_app_firewall_policy.main.id

  freeform_tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}
