output "private_ip_address" {
     value = "${azurerm_network_interface.nic.private_ip_address}"
}

output "nicid" {
     value = "${azurerm_network_interface.nic.id}"
}

output "vm_id" {
     value = "${azurerm_virtual_machine.virtual_machine.*.id}"
}