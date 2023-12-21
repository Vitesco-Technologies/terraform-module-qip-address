locals {
  name = "terraform-${random_string.name.id}"
}

resource "random_string" "name" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

module "address" {
  source = "../.."

  name   = local.name
  subnet = var.subnet

  additional_names = ["${local.name}-extra", "*.${local.name}"]

  # resolve_names = false
}

provider "qip" {
  # server = "https://qip.example.com"
  # org    = "Example"
  # username = "" # should be set via env QIP_USERNAME
  # password = "" # should be set via env QIP_PASSWORD
}

terraform {
  required_version = ">= 0.14"

  required_providers {
    qip = {
      source  = "Vitesco-Technologies/qip"
      version = ">= 1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3"
    }
  }
}
