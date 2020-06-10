## Resource Group ##
variable "resource_group_name" {}
variable "location" {}
variable "environment" {}

# Virtual Network
variable "vnet_address_space" {}
variable "subnet_name" {
  description = "subnet list"
  type = "list"
}
variable "subnet_address_prefix" {
  description = "address of subnet"
  type = "list"
}

variable "nsg_custom_rules" {}

#####

variable "vm_os_publisher" {}
variable "vm_os_offer" {}
variable  "vm_os_sku"     {}
variable "vm_immutable_os_disk" {}
variable "vm_immutable_data_disk" {}
variable "os_disk_caching" {}
variable "os_create_option" {}
variable "vm_os_disk_type" {}


## Compute VM ##
variable "vm_name_prefix" {}
variable "compute_nic_name" {}
variable "compute_vm_size" {}
variable "compute_vm_admin_username" {}
variable "key_file_name" {}


##Tags

variable "common_tags" {
  type = "map"
}
















