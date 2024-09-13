output "firewall_id" {
  value       = join("", google_compute_firewall.default[*].id)
  description = "Name of the resource. Provided by the client when the resource is created."
}

output "name" {
  value       = join("", google_compute_firewall.default[*].name)
  description = "an identifier for the resource with format"
}

output "firewall_creation_timestamp" {
  value       = join("", google_compute_firewall.default[*].creation_timestamp)
  description = "Creation timestamp in RFC3339 text format."
}

output "firewall_self_link" {
  value       = join("", google_compute_firewall.default[*].self_link)
  description = "The URI of the created resource."
}