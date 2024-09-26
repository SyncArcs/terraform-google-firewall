# Terraform-google-firewall
# Terraform Google Cloud firewall Module

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)
- [Author](#author)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction

This project deploys a Google Cloud infrastructure using Terraform to create firewall .

## Usage

To get started, make sure you have configured your GCP provider. You can use the following code as a starting point:
## Example: firewall
```hcl

module "firewall" {
  source        ="git::https://github.com/SyncArcs/terraform-google-firewall.git?ref=v1.0.0"
  name          = "app"
  environment   = "test"
  network       = module.vpc.vpc_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]

  allow = [
    {
      protocol = "tcp"
      ports    = ["22", "80"]
    }
  ]
}
```
Make sure to configure the provider block with your GCP credentials or use other authentication methods. Adjust the variables according to your requirements.

## Examples
For detailed examples on how to use these modules, please refer to the [Examples](https://github.com/SyncArcs/terraform-google-firewall/tree/master/example) directory within this repository.
## Author
Your Name Replace **MIT** and **SyncArcs** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/SyncArcs/terraform-google-firewall/blob/master/LICENCE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 5.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.85.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/SyncArcs/terraform-google-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow"></a> [allow](#input\_allow) | (Optional) The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection. | `list(any)` | `[]` | no |
| <a name="input_deny"></a> [deny](#input\_deny) | (Optional) The list of deny rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection. | `list(any)` | `[]` | no |
| <a name="input_direction"></a> [direction](#input\_direction) | Optional) Direction of traffic to which this firewall applies; default is INGRESS. Note: For INGRESS traffic, one of source\_ranges, source\_tags or source\_service\_accounts is required. Possible values are: INGRESS, EGRESS. | `string` | `"INGRESS"` | no |
| <a name="input_disabled"></a> [disabled](#input\_disabled) | (Optional) Denotes whether the firewall rule is disabled, i.e not applied to the network it is associated with. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist. If this is unspecified, the firewall rule will be enabled. | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | A boolean flag to enable/disable firewall. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_firewall_enabled"></a> [firewall\_enabled](#input\_firewall\_enabled) | A boolean flag to enable/disable firewall. | `bool` | `true` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'SyncArcs'. | `string` | `"SyncArcs"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `""` | no |
| <a name="input_network"></a> [network](#input\_network) | (Required) The VPC network the subnets belong to. Only networks that are in the distributed mode can have subnetworks. | `string` | `""` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | The priority of this route. | `number` | `1000` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/SyncArcs/terraform-google-firewall"` | no |
| <a name="input_source_ranges"></a> [source\_ranges](#input\_source\_ranges) | (Optional) If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_creation_timestamp"></a> [firewall\_creation\_timestamp](#output\_firewall\_creation\_timestamp) | Creation timestamp in RFC3339 text format. |
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | Name of the resource. Provided by the client when the resource is created. |
| <a name="output_firewall_self_link"></a> [firewall\_self\_link](#output\_firewall\_self\_link) | The URI of the created resource. |
| <a name="output_name"></a> [name](#output\_name) | an identifier for the resource with format |
<!-- END_TF_DOCS -->