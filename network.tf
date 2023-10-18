locals {
  # Flatten list of DNS servers from the DNS lookup.
  subnet_dns_servers = var.resolve_names ? flatten([for k in data.dns_a_record_set.subnet_dns : k.addrs]) : null
  # Flatten list of NTP servers from the DNS lookup. Defaults to DNS servers.
  subnet_ntp_servers = var.resolve_names ? coalescelist(flatten([for k in data.dns_a_record_set.subnet_ntp : k.addrs]), local.subnet_dns_servers) : null
  subnet_domain      = data.qip_v4subnet.net.domains[0]
  subnet_domains     = data.qip_v4subnet.net.domains
  subnet_gateway     = data.qip_v4subnet.net.default_routers[0]
}

# Retrieve data for the V4Subnet, to be used as additional meta data.
data "qip_v4subnet" "net" {
  address = var.subnet
}

# Resolve names to IP addresses for DNS servers.
data "dns_a_record_set" "subnet_dns" {
  for_each = var.resolve_names ? toset(data.qip_v4subnet.net.dns_servers) : []
  host     = each.key
}

# Resolve names to IP addresses for NTP time servers.
data "dns_a_record_set" "subnet_ntp" {
  for_each = var.resolve_names ? toset(data.qip_v4subnet.net.ntp_servers) : []
  host     = each.key
}
