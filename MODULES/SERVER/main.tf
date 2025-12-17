data "azurerm_key_vault" "kv" {
  name                = var.kv
  resource_group_name = var.key_vault_resource_group_name
}

data "azurerm_key_vault_secret" "db-username" {
  name                = var.kv_secret_db-username
  key_vault_id        = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "db-password" {
  name                = var.kv_secret_db-password
  key_vault_id        = data.azurerm_key_vault.kv.id
}

resource "azurerm_mssql_server" "server" {
  name                         = var.server-name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.db-username.value
  administrator_login_password = data.azurerm_key_vault_secret.db-password.value
}
