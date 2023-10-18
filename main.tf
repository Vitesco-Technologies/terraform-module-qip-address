/*
Copyright 2023 Vitesco Technologies Group AG

SPDX-License-Identifier: Apache-2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

locals {
  range_start = coalesce(var.subnet_range_start, cidrhost(data.qip_v4subnet.net.address_cidr, 20))
  range_end   = coalesce(var.subnet_range_end, cidrhost(data.qip_v4subnet.net.address_cidr, -21))
}

resource "qip_v4address" "address" {
  subnet  = var.subnet
  address = var.address
  name    = var.name

  subnet_range_start = local.range_start
  subnet_range_end   = local.range_end

  object_class = var.object_class
  description  = var.description
}

resource "qip_v4address_rr" "additional" {
  count = length(var.additional_names)

  name = var.additional_names[count.index]

  address     = qip_v4address.address.address
  domain_name = qip_v4address.address.domain_name
}
