provider "azurerm" {
  version = "2.0.0"
  features {}
}

### Set variable n 
variable "n" {
  default = "5"
}

locals {
  locations = ["eastus", "westus"]
  testlist2 = range(var.n)
  nestedforeach = flatten([
    for location in local.locations : [
      for number in local.testlist2: {
        location = location
        name   = join("-",[location,number])
      }
    ]
  ])
  association_map = {
    for obj in local.nestedforeach : "${obj.location}_${obj.name}" => obj
    }
}


// output test0 {
//   value = local.nestedforeach
// }

// output test1 {
//   value = local.association_map
// }


resource "azurerm_resource_group" "resource_group" {
  for_each = local.association_map
  name     = "my-test-candidate-${each.value.name}"
  location = "each.value.location"
  // tags = {
  //    ApplicationName = ""
  //    ApplicationId = ""
  //    BU = ""
  //    CoreID = ""
  //    CreatedBy = ""
  //    DeptID = ""
  //    Env = ""
  //    ProjectID = ""
  //    TerraformScriptVersion = ""
  // }
}
