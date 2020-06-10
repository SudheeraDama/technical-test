
resource "azurerm_virtual_network" "network" {
  name                = "${var.vnet_name}"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tags                = "${var.common_tags}"
}

resource "azurerm_subnet" "subnet" {
    count               = "${length(var.subnet_name)}"
    name                 = "${element(var.subnet_name, count.index)}"
    resource_group_name  = "${var.resource_group_name}"
    virtual_network_name = "${azurerm_virtual_network.network.name}"
    address_prefix       = "${element(var.address_prefix, count.index)}"
}