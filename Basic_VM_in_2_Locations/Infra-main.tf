provider "azurerm" {}

module "resource" {
  source                  = "./modules/azure-resource-group"
  resource_group_name     = "test-candidate-${var.location}"
  location                = "${var.location}"
  common_tags             = "${var.common_tags}"
}

module "virtual_network" {
  source                  = "./modules/azure-resource-network"
  resource_group_name     = "${module.resource.rg_name}"
  location                = "${var.location}"
  vnet_name               = "test-${var.location}-vnet"
  address_space           = "${var.vnet_address_space}"
  address_prefix          = "${var.subnet_address_prefix}"
  subnet_name             = "${var.subnet_name}"
  common_tags             = "${var.common_tags}"
}

module "virtual_network" {
  source                  = "./modules/azure-resource-network"
  resource_group_name     = "${module.resource.rg_name}"
  location                = "${var.location}"
  vnet_name               = "test-${var.location}-vnet"
  address_space           = "${var.vnet_address_space}"
  address_prefix          = "${var.subnet_address_prefix}"
  subnet_name             = "${var.subnet_name}"
  common_tags             = "${var.common_tags}"
}


module "network-security-group" {
  source                         = "./modules/azure-resource-nsg"
  module_resource_group_name     = "${module.resource.rg_name}"
  module_resource_group_location = "${var.location}"
  module_security_group_name     = "test-${var.location}-nsg"
  module_custom_rules            = "${var.nsg_custom_rules}"
  module_common_tags             = "${var.common_tags}"
}

resource "azurerm_subnet_network_security_group_association" "sg_assoc" {
  subnet_id = "${module.virtual_network.subnet}"
  network_security_group_id = "${module.network-security-group.network_security_group_id}"
}

module "compute" {
  source                  = "./modules/azure-resource-virtual-machine"
  resource_group_name     = "${module.resource.rg_name}"
  location                = "${var.location}"
  nic_name                = "${var.compute_nic_name}"
  subnet_id               = "${element(split(",",module.virtual_network.subnet), 0)}"
  vm_name_prefix          = "${var.vm_name_prefix}"
  vm_size                 = "${var.compute_vm_size}" //"Standard_E8s_v3"
  vm_immutable_os_disk    = "${var.vm_immutable_os_disk}"#"true"
  vm_immutable_data_disk  = "${var.vm_immutable_data_disk}"#"true"
  os_disk_caching         = "${var.os_disk_caching}"
  os_create_option        = "${var.os_create_option}"
  vm_os_disk_type         = "${var.vm_os_disk_type}"
  publisher               = "${var.vm_os_publisher}"
  offer                   = "${var.vm_os_offer}"
  sku                     = "${var.vm_os_sku}"
  file_name               = "${var.key_file_name}"
  vm_admin_username       = "${var.compute_vm_admin_username}"
  vm_init_script          = ""
  common_tags             = "${var.common_tags}"
}





