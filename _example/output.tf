
output "firewall_id" {
  value       = module.firewall.firewall_id
  description = "IDs of the created firewall rules."
}

output "firewall_names" {
  value       = module.firewall.firewall_names
  description = "Names of the created firewall rules."
}

output "firewall_creation_timestamps" {
  value       = module.firewall.firewall_creation_timestamps
  description = "Creation timestamps of the created firewall rules."
}

output "firewall_self_links" {
  value       = module.firewall.firewall_self_links
  description = "Self-links of the created firewall rules."
}
