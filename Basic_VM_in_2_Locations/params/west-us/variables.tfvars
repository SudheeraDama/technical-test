#-----------------------------------------------------------------------------
# Azure Resource Group variables
#-----------------------------------------------------------------------------
location            = "west us"
common_tags         = {
                      test="test"
}
#-----------------------------------------------------------------------------
# Network Variables block
#-----------------------------------------------------------------------------
vnet_address_space                = ["10.2.16.0/21","10.2.24.0/22","10.2.28.0/23","10.2.30.0/24"]
subnet_name                       = ["testsubnet1"]
subnet_address_prefix             = ["10.2.16.0/24"]
subnet_count                      = "1"

nsg_custom_rules = [
    {
      name                   = "ssh"
      priority               = "200"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      destination_port_range = "22"
      source_address_prefix  = "VirtualNetwork"
      description            = "ssh-for-vm-management"
    }
  ]
#-----------------------------------------------------------------------------
# Virtual Machines
#-----------------------------------------------------------------------------
vm_os_disk_type                   = "Premium_LRS"
vm_immutable_os_disk              = "true"
vm_immutable_data_disk            = "true"
vm_os_publisher                    = "RedHat"
vm_os_offer                        = "RHEL"
vm_os_sku                          = "7-RAW"
os_disk_caching                   = "ReadWrite"
os_create_option                  = "FromImage"

## Compute VM ##
vm_name_prefix                    = "test-westus-vm"
compute_nic_name                  = "test-nic"
compute_vm_size                   = "Standard_E8s_v3"
compute_vm_admin_username         = "test"
key_file_name                     = "test-westus"