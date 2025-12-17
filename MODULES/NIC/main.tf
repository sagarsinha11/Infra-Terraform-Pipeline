data "azurerm_public_ip" "data-pip" {
  name                = var.pip-name
  resource_group_name = var.resource-group-name
}

data "azurerm_subnet" "data-subnet-fe" {
  name                 = var.subnet-name
  virtual_network_name = var.vnet-name
  resource_group_name  = var.resource-group-name
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic-name
  location            = var.location
  resource_group_name = var.resource-group-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data-subnet-fe.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.data-pip.id
  }
}