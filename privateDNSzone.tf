## Creates a Private DNS Zone
resource "azurerm_private_dns_zone" "zone1" {
  name                = var.dns_name_zone_private
  resource_group_name = azurerm_resource_group.rg_one.name
}

## Creates a virtual link for the Private DNS Zone
resource "azurerm_private_dns_zone_virtual_network_link" "link1" {
  name                  = var.dns_name_zone_link
  resource_group_name   = azurerm_resource_group.rg_one.name
  private_dns_zone_name = azurerm_private_dns_zone.zone1.name
  virtual_network_id    = azurerm_virtual_network.vnet_main.id
  registration_enabled  = true
}