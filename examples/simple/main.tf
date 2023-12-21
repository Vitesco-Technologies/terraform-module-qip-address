module "address" {
  source = "../.."

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
