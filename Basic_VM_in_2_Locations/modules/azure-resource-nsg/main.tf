resource "azurerm_network_security_group" "resource_nsg" {
  name                = "${var.module_security_group_name}"
  location            = "${var.module_resource_group_location}"
  resource_group_name = "${var.module_resource_group_name}"
  tags = "${merge(var.module_common_tags, map("Name", var.module_security_group_name))}"
 
}

 

#############################
#  Detailed security rules  # 
#############################

resource "azurerm_network_security_rule" "resource_module_custom_rules" {
  count                       = "${length(var.module_custom_rules)}"
  name                        = "${lookup(var.module_custom_rules[count.index], "name", "default_rule_name")}"
  priority                    = "${lookup(var.module_custom_rules[count.index], "priority")}"
  direction                   = "${lookup(var.module_custom_rules[count.index], "direction", "Any")}"
  access                      = "${lookup(var.module_custom_rules[count.index], "access", "Allow")}"
  protocol                    = "${lookup(var.module_custom_rules[count.index], "protocol", "*")}"
  source_port_range          = "${lookup(var.module_custom_rules[count.index], "source_port_range", "*")}"
  destination_port_range     = "${lookup(var.module_custom_rules[count.index], "destionation_port_range", "*")}"
  source_address_prefix       = "${lookup(var.module_custom_rules[count.index], "source_address_prefix", "*")}"
  destination_address_prefix  = "${lookup(var.module_custom_rules[count.index], "destination_address_prefix", "*")}"
  description                 = "${lookup(var.module_custom_rules[count.index], "description", "Security rule for ${lookup(var.module_custom_rules[count.index], "name", "default_rule_name")}")}"
  resource_group_name         = "${var.module_resource_group_name}"
  network_security_group_name = "${azurerm_network_security_group.resource_nsg.name}"
}