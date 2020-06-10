variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "address_space" {}
variable "subnet_name" {type = "list"}
variable "address_prefix" { type = "list"}
variable "common_tags" {
 type = "map" 
}









                            