# Copyright (c) 2022 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

#--------------------------------------------------------------------------------------------------------------
# The defined_tags variable defines a Terraform object describing any set of OCI IAM defined_tags resources.
# The object is a two level map, with the first level defining the tag namespace and the second level defining
# the tags. Each map element is indexed by a unique string in uppercase, like BASE-TAG-NAMESPACE, GROUP-ROLES-TAG,
# CMP-TYPE-TAG, etc. These strings can actually be any random string, but once defined they MUST NOT BE CHANGED, 
# or Terraform will try to destroy and recreate the resources.
# Within the tags objects:
#   - is_cost_tracking defines whether the tag is used for cost tracking.
#   - is_retired indicates whether the tag is retired. Retired tags are no longer applied to resources.
#   - valid_values enforce the allowed values for the tag. 
#   - apply_default_to_compartments defined the list of compartments to which a default value is auto assigned.
#   - default_value defines the auto assigned value to compartments in the list.
#   - is_default_required, when true, sets default_value during resource creation.
#---------------------------------------------------------------------------------------------------------------

defined_tags = {  
  BASE-TAG-NAMESPACE  : { 
    compartment_id : null,
    namespace_name : "cislandingzone-base-tag-namespace",  
    namespace_description : "CIS Landing Zone base tag namespace.",    
    is_namespace_retired : false  
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
        is_default_required : false                
      },
      CMP-TYPE-TAG : {
        name : "cmp-type",
        description : "CIS Landing Zone compartment type.",
        is_cost_tracking : false,
        is_retired : false,
        valid_values : ["security","network","application","database","exainfra"],
        apply_default_to_compartments : null,
        default_value : null,
        is_default_required : false 
      }
    } 
  }
}  
