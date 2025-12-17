module "rg"{
  for_each = var.rg-config
    source ="../modules/RG"
    name = each.value.name
    location = each.value.location
}

module "vnet" {
  for_each = var.vnet-config
    depends_on = [ module.rg ]
    source = "../modules/vnet"
    rg_name = each.value.rg-name
    name = each.value.name
    location = each.value.location
    address_space = each.value.address_space
}

module "subnet" {
  for_each = var.subnet-config
    depends_on = [ module.vnet ]

    source = "../modules/subnet"
    name = each.value.name
    rg-name = each.value.rg-name
    vnet-name = each.value.vnet-name
    address_prefixes = each.value.address_prefix

}

module "pip"{
  for_each = var.pip-config
    depends_on = [ module.subnet ]
    source = "../modules/pip"
    resource_group_name = each.value.resource_group_name
    name = each.value.name
    location = each.value.location
}

module "nic" {
  for_each = var.nic-config
  depends_on = [ module.pip, module.subnet ]
  source = "../modules/nic"
  nic-name = each.value.nic-name
  resource-group-name = each.value.resource_group_name
  location = each.value.location
  pip-name = each.value.pip-name
  subnet-name = each.value.subnet-name
  vnet-name = each.value.vnet-name
  
}

module "vm" {
  for_each = var.vm-config
  depends_on = [ module.subnet , module.pip, module.nic]
  source     = "../modules/vm"
  location   = each.value.location
  resource-group-name = each.value.resource_group_name
  subnet-name = each.value.subnet_name
  vnet-name   = each.value.vnet_name
  nic-name    = each.value.nic_name
  vm-name     = each.value.vm-name
  kv    = each.value.kv
  key-vault-resource-group-name = each.value.key_vault_resource_group_name
  kv-secret-username = each.value.kv_secret_username
  kv-secret-password = each.value.kv_secret_password

}

module "db-server" {
  depends_on = [ module.rg ]
  source     = "../modules/server"
  server-name = "todo-db-server-b17"
  resource_group_name = "todo-rg"
  location = "Central India"
  kv = "b17-g13-kv"
  key_vault_resource_group_name = "rg-kv"
  kv_secret_db-username = "db-username"
  kv_secret_db-password = "db-password"
}

module "db" {
  depends_on = [ module.db-server ]
  source     = "../modules/database"
  server-name = "todo-db-server-b17"
  resource_group_name = "todo-rg"
  db-name = "todo-db"
}



module "nsg" {
  for_each = var.nsg-config
  depends_on = [ module.rg, module.vnet, module.subnet, module.nic ]
  source = "../modules/NSG"
  nsg-name = each.value.nsg_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
}

module "nsg-nic"{
  for_each = var.nsg-nic-config
  depends_on = [ module.subnet , module.nsg , module.nic ]
  source = "../modules/NSG-NIC"
  subnet_name = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
  nsg_name = each.value.nsg_name
}