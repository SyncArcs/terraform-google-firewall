variable "name" {
  type        = string
  default     = ""
  description = "Name of the resource. Provided by the client when the resource is created. "
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "repository" {
  type        = string
  default     = "https://github.com/SyncArcs/terraform-google-firewall"
  description = "Terraform current module repo"
}

variable "managedby" {
  type        = string
  default     = "SyncArcs"
  description = "ManagedBy, eg 'SyncArcs'."
}

variable "network" {
  type        = string
  default     = ""
  description = "(Required) The VPC network the subnets belong to. Only networks that are in the distributed mode can have subnetworks."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable firewall."
}

variable "firewall_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable firewall."
}

variable "direction" {
  type        = string
  default     = "INGRESS"
  description = "Optional) Direction of traffic to which this firewall applies; default is INGRESS. Note: For INGRESS traffic, one of source_ranges, source_tags or source_service_accounts is required. Possible values are: INGRESS, EGRESS."
}

variable "disabled" {
  type        = bool
  default     = false
  description = " (Optional) Denotes whether the firewall rule is disabled, i.e not applied to the network it is associated with. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist. If this is unspecified, the firewall rule will be enabled."
}

variable "priority" {
  type        = number
  default     = 1000
  description = "The priority of this route."
}

variable "allow" {
  type        = list(any)
  default     = []
  description = "(Optional) The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection."
}

variable "deny" {
  type        = list(any)
  default     = []
  description = "(Optional) The list of deny rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection."
}

variable "source_ranges" {
  type        = any
  default     = []
  description = "(Optional) If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges."
}

