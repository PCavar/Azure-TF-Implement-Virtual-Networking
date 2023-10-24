##Resource Group
resource "azurerm_resource_group" "rg_one" {
  name     = var.azure_resource_group_name
  location = var.azure_region[0]
}

resource "azurerm_virtual_network" "vnet_main" {
  name                = var.azure_virtual_network["vnet1"].name
  location            = azurerm_resource_group.rg_one.location
  resource_group_name = azurerm_resource_group.rg_one.name
  address_space       = [var.azure_virtual_network["vnet1"].cidr]
}

resource "azurerm_subnet" "subnet0" {
  name                 = var.azure_subnets["subnet0"].name
  resource_group_name  = azurerm_resource_group.rg_one.name
  virtual_network_name = azurerm_virtual_network.vnet_main.name
  address_prefixes     = [var.azure_subnets["subnet0"].cidr]
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.azure_subnets["subnet1"].name
  resource_group_name  = azurerm_resource_group.rg_one.name
  virtual_network_name = azurerm_virtual_network.vnet_main.name
  address_prefixes     = [var.azure_subnets["subnet1"].cidr]
}
