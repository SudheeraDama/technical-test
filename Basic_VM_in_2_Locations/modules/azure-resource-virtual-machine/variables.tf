variable "vm_name_prefix" {}
variable "location" {}
variable "resource_group_name" {}
variable "vm_size" {}
variable "vm_admin_username" {}
variable "vm_immutable_os_disk" {}
variable "vm_immutable_data_disk" {}
variable "vm_os_disk_type" {}
variable "os_disk_caching" {}
variable "os_create_option" {}
#variable "name_nsg" {}
variable "nic_name" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "subnet_id" {}
variable "vm_init_script" {}
variable "ip_config_name" {
default = "config1"
}
variable "file_name" {}

variable "private_ip_address_allocation" {
  default = "dynamic"
}
variable "common_tags" {
  type = "map"
}





