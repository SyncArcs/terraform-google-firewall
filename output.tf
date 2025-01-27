
# Outputs for Firewall Rules
output "firewall_id" {
  value       = [for rule in google_compute_firewall.rules : rule.id]
  description = "IDs of the created firewall rules."
}

output "firewall_names" {
  value       = [for rule in google_compute_firewall.rules : rule.name]
  description = "Names of the created firewall rules."
}

output "firewall_creation_timestamps" {
  value       = [for rule in google_compute_firewall.rules : rule.creation_timestamp]
  description = "Creation timestamps of the created firewall rules."
}

output "firewall_self_links" {
  value       = [for rule in google_compute_firewall.rules : rule.self_link]
  description = "Self-links of the created firewall rules."
}

