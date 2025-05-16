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
  ingress_rules = [
    {
      name          = "allow-tcp-http-ingress"
      description   = "Allow TCP, HTTP ingress traffic"
      disabled      = false
      direction     = "INGRESS"
      priority      = 1000
      source_ranges = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["22", "80"]
        }
      ]
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
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.50, < 5.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::https://github.com/SyncArcs/terraform-google-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | List of egress firewall rules. | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    disabled                = optional(bool, null)<br>    direction               = string # "EGRESS"<br>    destination_ranges      = optional(list(string), ["0.0.0.0/0"])<br>    target_tags             = optional(list(string), null)<br>    target_service_accounts = optional(list(string), null)<br>    priority                = optional(number, 1000)<br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string), ["all"])<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string), null)<br>    })), [])<br>  }))</pre> | <pre>[<br>  {<br>    "allow": [<br>      {<br>        "ports": [],<br>        "protocol": "all"<br>      }<br>    ],<br>    "description": "Allow all egress traffic",<br>    "destination_ranges": [<br>      "0.0.0.0/0"<br>    ],<br>    "direction": "EGRESS",<br>    "disabled": false,<br>    "name": "allow-all-egress",<br>    "priority": 1000<br>  }<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | List of ingress firewall rules. | <pre>list(object({<br>    name                    = string<br>    description             = optional(string, null)<br>    disabled                = optional(bool, null)<br>    direction               = string # "INGRESS"<br>    source_ranges           = optional(list(string), ["0.0.0.0/0"])<br>    source_tags             = optional(list(string), null)<br>    source_service_accounts = optional(list(string), null)<br>    target_tags             = optional(list(string), null)<br>    target_service_accounts = optional(list(string), null)<br>    priority                = optional(number, 1000)<br>    allow = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string), ["all"])<br>    })), [])<br>    deny = optional(list(object({<br>      protocol = string<br>      ports    = optional(list(string), null)<br>    })), [])<br>  }))</pre> | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`, 'attribute' [`webserver`,`qa`,`devops`,`public`,]. | `list(string)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, e.g. 'info@SyncArcs.com'. | `string` | `"info@SyncArcs.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `""` | no |
| <a name="input_network"></a> [network](#input\_network) | (Required) The VPC network the subnets belong to. Only networks that are in distributed mode can have subnetworks. | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repository. | `string` | `"https://github.com/SyncArcs/terraform-google-firewall"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_creation_timestamps"></a> [firewall\_creation\_timestamps](#output\_firewall\_creation\_timestamps) | Creation timestamps of the created firewall rules. |
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | IDs of the created firewall rules. |
| <a name="output_firewall_names"></a> [firewall\_names](#output\_firewall\_names) | Names of the created firewall rules. |
| <a name="output_firewall_self_links"></a> [firewall\_self\_links](#output\_firewall\_self\_links) | Self-links of the created firewall rules. |
<!-- END_TF_DOCS -->