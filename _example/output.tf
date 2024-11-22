output "firewall_id" {
  value       = module.firewall.firewall_id
  description = "Name of the resource. Provided by the client when the resource is created."
}

output "name" {
  value       = module.firewall.name
  description = "an identifier for the resource with format"
}

output "firewall_creation_timestamp" {
  value       = module.firewall.firewall_creation_timestamp
  description = "Creation timestamp in RFC3339 text format."
}

output "firewall_self_link" {
  value       = module.firewall.firewall_self_link
  description = "The URI of the created resource."
}