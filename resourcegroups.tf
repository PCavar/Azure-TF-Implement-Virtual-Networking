##Resource Group
resource "azurerm_resource_group" "rg_one" {
  name     = var.azure_resource_group_name
  location = var.azure_region[0]
}
