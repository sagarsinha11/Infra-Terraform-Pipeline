rg-config = {
  "rg1" = {
    name = "todo-rg"
    location = "Central India"
  }
  "rg2" = {
    name = "rgv"
    location = "Central India"
  }
}

vnet-config = {
  "vnet-1" = {
    name = "todo-vnet"
    rg-name = "todo-rg"
    location = "Central India"
    address_space = ["10.0.0.0/16"]
  }
}

subnet-config = {
  "fe-subnet" = {
    name = "fe-subnet"
    rg-name = "todo-rg"
    vnet-name = "todo-vnet"
    address_prefix = ["10.0.1.0/24"]
  }
  "be-subnet" = {
        name = "be-subnet"
        rg-name = "todo-rg"
        vnet-name = "todo-vnet"
        address_prefix = ["10.0.2.0/24"]
    }
}

pip-config = {
  "pip-fe" = {
    resource_group_name = "todo-rg"
    name = "todo-pip-fe"
    location = "Central India"
  }
  "pip-be" = {
    resource_group_name = "todo-rg"
    name = "todo-pip-be"
    location = "Central India"
  }
}

vm-config = {
  "vm1" = {
    vm-name = "fe-vm"
    resource_group_name = "todo-rg"
    location = "Central India"
    subnet_name = "fe-subnet"
    vnet_name = "todo-vnet"
    nic_name = "todo-nic-fe"
    kv = "b17-g13-kv"
    key_vault_resource_group_name = "rg-kv"
    kv_secret_username = "fe-vm-username"
    kv_secret_password = "fe-vm-password"
  }
    "vm2" = {
        vm-name = "be-vm"
        resource_group_name = "todo-rg"
        location = "Central India"
        subnet_name = "be-subnet"
        vnet_name = "todo-vnet"
        nic_name = "todo-nic-be"
        kv = "b17-g13-kv"
        key_vault_resource_group_name = "rg-kv"
        kv_secret_username = "fe-vm-username"
        kv_secret_password = "fe-vm-password"
    }
}

nic-config = {
  "nic-fe" = {
    nic-name = "todo-nic-fe"
    resource_group_name = "todo-rg"
    location = "Central India"
    subnet-name = "fe-subnet"
    pip-name = "todo-pip-fe"
    vnet-name = "todo-vnet"
  }
  "nic-be" = {
    nic-name = "todo-nic-be"
    resource_group_name = "todo-rg"
    location = "Central India"
    subnet-name = "be-subnet"
    pip-name = "todo-pip-be"
    vnet-name = "todo-vnet"
  }
}

nsg-config = {
  "nsg-fe" = {
    nsg_name = "todo-nsg-fe"
    resource_group_name = "todo-rg"
    location = "Central India"
  }
  "nsg-be" = {
    nsg_name = "todo-nsg-be"
    resource_group_name = "todo-rg"
    location = "Central India"
  }
}

nsg-nic-config = {
  "nsg-nic-fe" = {
    subnet_name = "fe-subnet"
    virtual_network_name = "todo-vnet"
    resource_group_name = "todo-rg"
    nsg_name = "todo-nsg-fe"
  }
  "nsg-nic-be" = {
    subnet_name = "be-subnet"
    virtual_network_name = "todo-vnet"
    resource_group_name = "todo-rg"
    nsg_name = "todo-nsg-be"
  }
}