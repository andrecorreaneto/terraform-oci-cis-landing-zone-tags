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
  FINANCE-NAMESPACE  : { 
    compartment_id : null,
    namespace_name : "finance",  
    namespace_description : "Finances division's tag namespace.",    
    is_namespace_retired : false,  
    defined_tags : null,
    freeform_tags : null
    tags : {
      COST-CENTER-TAG : {
        name : "cost-center",
        description : "Cost center.",
        is_cost_tracking : true,
        is_retired : false,
        valid_values : ["a1","b1","c1"] # tag values are checked against these values upon resource tagging.
        apply_default_to_compartments : null, # ["ocid1","ocid2","ocidN"] Optional, provide a list of compartment ocids where you want to apply the default_value.
        default_value : null,
        is_default_required : true,
        defined_tags : null,
        freeform_tags : null                
      },
      ENVIRONMENT-TAG : {
        name : "environment-class",
        description : "Environment class. high for production, low for others, like development, test, sandbox etc.",
        is_cost_tracking : false,
        is_retired : false,
        valid_values : ["high","low"], # tag values are checked against these values upon resource tagging.
        apply_default_to_compartments : null, # ["ocid1","ocid2","ocidN"] Optional, provide a list of compartment ocids where you want to apply the default_value.
        default_value : null,
        is_default_required : true,
        defined_tags : null,
        freeform_tags : null 
      },
      RESOURCE-ID-TAG : {
        name : "resource-id",
        description : "A random resource id, used to communicate any business-specific metadata about resources",
        is_cost_tracking : false,
        is_retired : false,
        valid_values : null, # no checks upon resource tagging
        apply_default_to_compartments : null, # ["ocid1","ocid2","ocidN"] Optional, provide a list of compartment ocids where you want to apply the default_value.
        default_value : null,
        is_default_required : true,
        defined_tags : null,
        freeform_tags : null 
      }
    } 
  }
}  
