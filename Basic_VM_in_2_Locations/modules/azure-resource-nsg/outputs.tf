output "network_security_group_id" {
  value = "${azurerm_network_security_group.resource_nsg.id}"
}

output "network_security_group_name" {
  value = "${azurerm_network_security_group.resource_nsg.name}"
}