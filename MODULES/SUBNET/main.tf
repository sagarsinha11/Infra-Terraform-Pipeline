resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = var.address_prefixes
}