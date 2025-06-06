# Virtual Machine
resource "azurerm_linux_virtual_machine" "ynov1-vm" {
  name                = "${var.prefix}-vm"
  location            = azurerm_resource_group.ynov1-rg.location
  resource_group_name = azurerm_resource_group.ynov1-rg.name
  network_interface_ids = [
    azurerm_network_interface.ynov1-nic.id
  ]
  size           = "Standard_B1ms"
  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    # public_key = file("~/.ssh/id_rsa.pub")
    public_key = var.ssh_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Virtual Machine"
    project     = "${var.project}"
  }
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.ynov1-vm.name
}
