# OCI IAM Tags Module Example

## Introduction

This example shows how to manage defined tags in Oracle Cloud Infrastructure.

The following resources are created in this example:

* One tag namespace, two tags and no tag defaults.

## Using this example
* Prepare one variable file named `terraform.tfvars` with the required IAM information. The contents of `terraform.tfvars` should look something like the following (or copy and re-use the contents of `terraform.tfvars.template`:

```
### TENANCY DETAILS
#
# Get this from OCI Console (after logging in, go to top-right-most menu item and click option "Tenancy: <your tenancy name>").
tenancy_id="<tenancy OCID>"
#
# Get this from OCI Console (after logging in, go to top-right-most menu item and click option "My profile").
user_id="<user OCID>"
#
# The fingerprint can be gathered from your user account. In the "My profile page, click "API keys" on the menu in left hand side).
fingerprint="<PEM key fingerprint>"
#
# This is the full path on your local system to the private key used for the API signing key pair.
private_key_path="<path to the private key that matches the fingerprint above>"
#
# This is the password that protects the private key, if any.
private_key_password=""
#
# This is your tenancy home region.
home_region="<your tenancy home region>"
```

`main.tf`:

```
module "cislz_tags" {
  source                         = "../../"
  tenancy_id                     = var.tenancy_id
  cislz_namespace_compartment_id = var.tenancy_id
  tag_name_prefix                = "cislandingzone"
  defined_tags                   = var.defined_tags
}

```

The defined_tags variable is defined in `input.auto.tfvars` file, as:

```
defined_tags = {  
  BASE-TAG-NAMESPACE  : { 
    compartment_id : null,
    namespace_name : "cislandingzone-base-tag-namespace",  
    namespace_description : "CIS Landing Zone base tag namespace.",    
    is_namespace_retired : false,  
    defined_tags : null,
    freeform_tags : null
    tags : {
      GROUP-ROLES-TAG : {
        name : "roles",
        description : "CIS Landing Zone group roles.",
        is_cost_tracking : false,
        is_retired : false,
        valid_values : ["iam-admin","cred-admin","cost-admin","security-admin",
                        "network-admin","application-admin","database-admin","exainfra-admin",
                        "storage-admin","auditor","announcement-reader",
                        "dyn-compute-agent","dyn-database-kms","dyn-security-function","dyn-application-function"]
        apply_default_to_compartments : null,
        default_value : null,
        is_default_required : false,
        defined_tags : null,
        freeform_tags : null                
      },
      CMP-TYPE-TAG : {
        name : "cmp-type",
        description : "CIS Landing Zone compartment type.",
        is_cost_tracking : false,
        is_retired : false,
        valid_values : ["security","network","application","database","exainfra"],
        apply_default_to_compartments : null,
        default_value : null,
        is_default_required : false,
        defined_tags : null,
        freeform_tags : null 
      }
    } 
  }
} 
```

Then execute the example using the usual Terraform workflow:

```
$ terraform init
$ terraform plan
$ terraform apply
```