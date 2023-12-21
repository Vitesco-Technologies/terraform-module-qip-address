terraform {
  required_version = ">= 0.14"

  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = "~> 3.2"
    }
    qip = {
      source  = "Vitesco-Technologies/qip"
      version = ">= 1"
    }
  }
}
