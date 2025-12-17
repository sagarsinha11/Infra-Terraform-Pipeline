data "azurerm_network_interface" "data-nic" {
  name                = var.nic-name
  resource_group_name = var.resource-group-name
}

data "azurerm_key_vault" "existing" {
  name                = var.kv
  resource_group_name = var.key-vault-resource-group-name
}

data "azurerm_key_vault_secret" "data-secret-username" {
  name         = var.kv-secret-username
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "data-secret-password" {
  name         = var.kv-secret-password
  key_vault_id = data.azurerm_key_vault.existing.id
}



resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = var.vm-name
  resource_group_name = var.resource-group-name
  location            = var.location
  size                = "Standard_D2s_v3"
  admin_username      = data.azurerm_key_vault_secret.data-secret-username.value
  admin_password      = data.azurerm_key_vault_secret.data-secret-password.value
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.data-nic.id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}