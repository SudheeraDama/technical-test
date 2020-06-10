
output "name" {
     value = "${azurerm_virtual_network.network.name}"
}
output "subnet" {
 value = "${join(",",azurerm_subnet.subnet.*.id)}"
}
output "sqlsubnet" {
  value = "${azurerm_subnet.sql_subnet.id}"
}
