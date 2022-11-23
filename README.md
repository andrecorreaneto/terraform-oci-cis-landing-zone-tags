# CIS OCI Landing Zone IAM Tags Module

![Landing Zone logo](./images/landing_zone_300.png)

This module manages defined tags resources in Oracle Cloud Infrastructure. A defined tag requires an enclosing tag namespace and can be auto-assigned default values in specific compartments.

Per CIS (Center for Internet Security) OCI Benchmark requirement, the module checks for an eventually pre-configured tag namespace (tipically named *Oracle-Tags*). If the namespace does not exist and input variable *enable_cislz_namespace* is set to true, the module manages an additional tag namespace with two tags used to identify resource creators (*CreatedBy*) and when resources are created (*CreatedOn*). This additional namespace and associated tags can have their names customized through input variables *cislz_namespace_name*, *cislz_created_by_tag_name*, and *cislz_created_on_tag_name*, respectively.

Check [module specification](./SPEC.md) for a full description of module requirements, supported variables, managed resources and outputs.

## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License
Copyright (c) 2022, Oracle and/or its affiliates.

Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

See [LICENSE](./LICENSE) for more details.

## Known Issues
None.
