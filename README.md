# Terraform module for addresses in Nokia QIP

Based on [terraform-provider-qip](https://github.com/Vitesco-Technologies/terraform-provider-qip) to manage IPv4 addresses in a subnet of Nokia QIP.

<!-- BEGIN_TF_DOCS -->
## Example

<!-- x-release-please-start-version -->

If you want to use the module in your terraform code, please use a versioned reference:

```
source = "git::https://github.com/Vitesco-Technologies/terraform-module-qip-address?ref=v0.0.0"
```

<!-- x-release-please-end -->

```terraform
module "address" {
  source = "git::https://github.com/Vitesco-Technologies/terraform-module-qip-address"

  name   = "terraform-test"
  subnet = "192.0.2.0"

  # subnet_range_start = "192.0.2.20"
  # subnet_range_end   = "192.0.2.50"

  # object_class = "Virtualized Server"
  # description  = "This is a very special host"

  # additional_names = ["*.terraform-test"]
}

provider "qip" {
  # server = "https://qip.example.com" # should be set via env QIP_SERVER
  # org    = "Example"                 # should be set via env QIP_ORG
  # username = ""                      # should be set via env QIP_USERNAME
  # password = ""                      # should be set via env QIP_PASSWORD
}

terraform {
  required_version = ">= 0.14"

  required_providers {
    qip = {
      source  = "Vitesco-Technologies/qip"
      version = ">= 1"
    }
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_dns"></a> [dns](#requirement\_dns) | ~> 3.2 |
| <a name="requirement_qip"></a> [qip](#requirement\_qip) | >= 1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_dns"></a> [dns](#provider\_dns) | ~> 3.2 |
| <a name="provider_qip"></a> [qip](#provider\_qip) | >= 1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_names"></a> [additional\_names](#input\_additional\_names) | Additional names for the address (with the same domain) | `list(string)` | `[]` | no |
| <a name="input_address"></a> [address](#input\_address) | Manually provide a IPv4 address to manage. Not recommended | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Object description for the address | `string` | `"Managed by Terraform"` | no |
| <a name="input_name"></a> [name](#input\_name) | Hostname to register with the local domain of the subnet | `string` | n/a | yes |
| <a name="input_object_class"></a> [object\_class](#input\_object\_class) | Object class for the address | `string` | `"Virtualized Server"` | no |
| <a name="input_resolve_names"></a> [resolve\_names](#input\_resolve\_names) | Resolve names of DNS and NTP servers into IP addresses. | `bool` | `true` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | IPv4 subnet address to create the address in | `string` | n/a | yes |
| <a name="input_subnet_range_end"></a> [subnet\_range\_end](#input\_subnet\_range\_end) | End of an address range to select the address in (defaults to the 20th to last host of the subnet, e.g. 192.0.2.235 for 192.0.2.0/24) | `string` | `null` | no |
| <a name="input_subnet_range_start"></a> [subnet\_range\_start](#input\_subnet\_range\_start) | Begin of an address range to select the address in (defaults to the 20th host of the subnet, e.g. 192.0.2.20 for 192.0.2.0/24) | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output\_address) | The actual IPv4 address managed |
| <a name="output_address_cidr"></a> [address\_cidr](#output\_address\_cidr) | Address in CIDR notation including the prefix length (e.g. 192.0.2.11/24) |
| <a name="output_dns_servers"></a> [dns\_servers](#output\_dns\_servers) | IP addresses of all DNS servers assigned to the subnet |
| <a name="output_domain"></a> [domain](#output\_domain) | Local domain assigned to the subnet |
| <a name="output_domains"></a> [domains](#output\_domains) | All domains assigned to the subnet for lookups |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | FQDN (full qualified domain name) for the address |
| <a name="output_gateway"></a> [gateway](#output\_gateway) | Default gateway for the subnet |
| <a name="output_network_mask"></a> [network\_mask](#output\_network\_mask) | Network mask for the address (e.g. 255.255.255.0) |
| <a name="output_ntp_servers"></a> [ntp\_servers](#output\_ntp\_servers) | IP addresses of all NTP servers assigned to the subnet. Defaults to the DNS servers |
| <a name="output_prefix_length"></a> [prefix\_length](#output\_prefix\_length) | CIDR prefix length (e.g. 24) |
<!-- END_TF_DOCS -->
