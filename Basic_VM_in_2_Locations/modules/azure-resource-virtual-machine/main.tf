############### VM network interfaces ###################
##NIC
resource "azurerm_network_interface" "nic" {
    name                      = "${var.nic_name}"
    location                  = "${var.location}"
    resource_group_name       = "${var.resource_group_name}"
    #network_security_group_id = "${var.nsg}"

    ip_configuration {
        name                          = "${var.ip_config_name}"
        subnet_id                     = "${var.subnet_id}"
        private_ip_address_allocation = "${var.private_ip_address_allocation}"
    }
    
}

######### virtual machine #############

resource "azurerm_virtual_machine" "virtual_machine" {
    name                                = "${var.vm_name_prefix}"
    location                            = "${var.location}"
    resource_group_name                 = "${var.resource_group_name}"
    network_interface_ids               = ["${azurerm_network_interface.nic.id}"]
    vm_size                             = "${var.vm_size}"
    tags                                = "${var.common_tags}"
    
    delete_os_disk_on_termination       = "${var.vm_immutable_os_disk}"
    delete_data_disks_on_termination    = "${var.vm_immutable_data_disk}"
    
    storage_os_disk {
        name                            = "${var.vm_name_prefix}-os"
        caching                         = "${var.os_disk_caching}"
        create_option                   = "${var.os_create_option}"
        managed_disk_type               = "${var.vm_os_disk_type}"
    }
    
    storage_image_reference {
        publisher                       = "${var.publisher}"
        offer                           = "${var.offer}"
        sku                             = "${var.sku}"
        version                         = "latest"
    }

    os_profile {    
        computer_name                   = "${var.vm_name_prefix}"
        admin_username                  = "${var.vm_admin_username}"
        custom_data                     = "${var.vm_init_script}"
    }
    
    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path                        = "/home/${var.vm_admin_username}/.ssh/authorized_keys"
            key_data                    = "${file("${path.module}/${var.file_name}.pub")}"
        }
    }
        
}

