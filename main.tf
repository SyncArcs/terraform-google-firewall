module "labels" {
  source      = "git::https://github.com/SyncArcs/terraform-google-labels.git?ref=v1.0.0"
  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}

data "google_client_config" "current" {
}

#####==============================================================================
##### Each network has its own firewall controlling access to and from the instances.
#####==============================================================================
resource "google_compute_firewall" "rules" {
  for_each = {
    for r in concat(var.ingress_rules, var.egress_rules) : r.name => r
    if r.direction == "INGRESS" || r.direction == "EGRESS"
  }

  name        = each.value.name
  description = each.value.description
  direction   = each.value.direction # INGRESS or EGRESS
  disabled    = each.value.disabled
  network     = var.network
  project     = data.google_client_config.current.project

  # For ingress rules
  source_ranges           = lookup(each.value, "source_ranges", null)
  source_tags             = lookup(each.value, "source_tags", null)
  source_service_accounts = lookup(each.value, "source_service_accounts", null)
  target_tags             = lookup(each.value, "target_tags", null)
  target_service_accounts = lookup(each.value, "target_service_accounts", null)

  # For egress rules
  destination_ranges = lookup(each.value, "destination_ranges", null)

  priority = each.value.priority

  dynamic "log_config" {
    for_each = lookup(each.value, "log_config", null) == null ? [] : [each.value.log_config]
    content {
      metadata = log_config.value.metadata
    }
  }

  dynamic "allow" {
    for_each = lookup(each.value, "allow", [])
    content {
      protocol = allow.value.protocol
      ports    = lookup(allow.value, "ports", null)
    }
  }

  dynamic "deny" {
    for_each = lookup(each.value, "deny", [])
    content {
      protocol = deny.value.protocol
      ports    = lookup(deny.value, "ports", null)
      # No source_ranges needed here for deny blocks in the firewall resource
    }
  }
}