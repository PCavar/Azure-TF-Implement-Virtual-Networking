resource "azurerm_public_ip" "vm_pips" {
  for_each            = var.azure_virtual_machines
  name                = each.value.public_ip_name
  location            = azurerm_resource_group.rg_one.location
  resource_group_name = azurerm_resource_group.rg_one.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "vm_nics" {
  for_each            = var.azure_virtual_machines
  name                = each.value.nic_name
  location            = azurerm_resource_group.rg_one.location
  resource_group_name = azurerm_resource_group.rg_one.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.key == "vm0" ? azurerm_subnet.subnet0.id : azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pips[each.key].id
  }
}

resource "azurerm_windows_virtual_machine" "vms" {
  for_each            = var.azure_virtual_machines
  name                = each.value.name
  location            = azurerm_resource_group.rg_one.location
  resource_group_name = azurerm_resource_group.rg_one.name
  size                = each.value.size_sku

  admin_username = each.value.admin_name
  admin_password = each.value.admin_pass

  network_interface_ids = [
    azurerm_network_interface.vm_nics[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = each.value.storage_account_type_ref
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.azure_network_security_group
  location            = azurerm_resource_group.rg_one.location
  resource_group_name = azurerm_resource_group.rg_one.name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_attachment_nic" {
  for_each                  = azurerm_network_interface.vm_nics
  network_interface_id      = each.value.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}