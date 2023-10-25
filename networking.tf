## VNET for deployment
resource "azurerm_virtual_network" "vnet_main" {
  name                = var.azure_virtual_network["vnet1"].name
  location            = azurerm_resource_group.rg_one.location
  resource_group_name = azurerm_resource_group.rg_one.name
  address_space       = [var.azure_virtual_network["vnet1"].cidr]
}

## Subnet one
resource "azurerm_subnet" "subnet0" {
  name                 = var.azure_subnets["subnet0"].name
  resource_group_name  = azurerm_resource_group.rg_one.name
  virtual_network_name = azurerm_virtual_network.vnet_main.name
  address_prefixes     = [var.azure_subnets["subnet0"].cidr]
}

## Subnet two
resource "azurerm_subnet" "subnet1" {
  name                 = var.azure_subnets["subnet1"].name
  resource_group_name  = azurerm_resource_group.rg_one.name
  virtual_network_name = azurerm_virtual_network.vnet_main.name
  address_prefixes     = [var.azure_subnets["subnet1"].cidr]
}
