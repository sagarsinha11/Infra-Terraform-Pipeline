variable "rg-config" {
    type = map(object({
        name = string
        location = string
    })) 
}

variable "vnet-config"{
    type = map(object({
      name = string
      rg-name = string
      location = string
      address_space = list(string)
    }))
}

variable "subnet-config"{
    type = map(object({
        name = string
        rg-name = string
        vnet-name = string
        address_prefix = list(string)
    }))
}

variable "pip-config" {
    type = map(object({
        resource_group_name = string
        name = string
        location = string
    }))
}

variable "vm-config"{
    type = map(object({
      vm-name = string
      resource_group_name = string
      location = string
      subnet_name = string
      vnet_name = string
      nic_name = string
      kv = string
      key_vault_resource_group_name = string
      kv_secret_username = string
      kv_secret_password = string
    }))
}

variable "nic-config" {
    type = map(object({
        nic-name = string
        resource_group_name = string
        location = string
        subnet-name = string
        pip-name = string
        vnet-name = string
    }))     
  
}

variable "nsg-config" {
    type = map(object({
        nsg_name = string
        resource_group_name = string
        location = string
    }))
}

variable "nsg-nic-config" {
    type = map(object({
        subnet_name = string
        virtual_network_name = string
        resource_group_name = string
        nsg_name = string
    }))
}