output "address" {
  description = "The actual IPv4 address managed"
  value       = qip_v4address.address.address
}

output "network_mask" {
  description = "Network mask for the address (e.g. 255.255.255.0)"
  value       = data.qip_v4subnet.net.mask
}

output "prefix_length" {
  description = "CIDR prefix length (e.g. 24)"
  value       = data.qip_v4subnet.net.prefix_length
}

output "address_cidr" {
  description = "Address in CIDR notation including the prefix length (e.g. 192.0.2.11/24)"
  value       = "${qip_v4address.address.address}/${data.qip_v4subnet.net.prefix_length}"
}

output "gateway" {
  description = "Default gateway for the subnet"
  value       = local.subnet_gateway
}

output "domain" {
  description = "Local domain assigned to the subnet"
  value       = local.subnet_domain
}

output "fqdn" {
  description = "FQDN (full qualified domain name) for the address"
  value       = "${var.name}.${local.subnet_domain}"
}

output "domains" {
  description = "All domains assigned to the subnet for lookups"
  value       = local.subnet_domains
}

output "dns_servers" {
  description = "IP addresses of all DNS servers assigned to the subnet"
  value       = local.subnet_dns_servers
}

output "ntp_servers" {
  description = "IP addresses of all NTP servers assigned to the subnet. Defaults to the DNS servers"
  value       = local.subnet_ntp_servers
}
