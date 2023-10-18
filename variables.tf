variable "name" {
  type        = string
  description = "Hostname to register with the local domain of the subnet"
}

variable "address" {
  type        = string
  description = "Manually provide a IPv4 address to manage. Not recommended"
  default     = null
}

variable "subnet" {
  type        = string
  description = "IPv4 subnet address to create the address in"
}

variable "subnet_range_start" {
  type        = string
  description = "Begin of an address range to select the address in (defaults to the 20th host of the subnet, e.g. 192.0.2.20 for 192.0.2.0/24)"
  default     = null
}

variable "subnet_range_end" {
  type        = string
  description = "End of an address range to select the address in (defaults to the 20th to last host of the subnet, e.g. 192.0.2.235 for 192.0.2.0/24)"
  default     = null
}

variable "object_class" {
  type        = string
  description = "Object class for the address"
  default     = "Virtualized Server"
}

variable "description" {
  type        = string
  description = "Object description for the address"
  default     = "Managed by Terraform"
}

variable "additional_names" {
  type        = list(string)
  description = "Additional names for the address (with the same domain)"
  default     = []
}

variable "resolve_names" {
  type        = bool
  description = "Resolve names of DNS and NTP servers into IP addresses."
  default     = true
}
