# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

module "cislz_tags" {
  source                         = "../../"
  tenancy_id                     = var.tenancy_id
  enable_cislz_namespace         = true
  cislz_namespace_compartment_id = var.tenancy_id
  tag_name_prefix                = "cislandingzone"
  defined_tags                   = var.defined_tags
  oracle_default_namespace_name = "test"
  cislz_freeform_tags            = {"cis-landing-zone":"quickstart"}
}