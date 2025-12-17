variable "subnet_name" {
  description = "The name of the subnet to associate with the NSG."
}

variable "virtual_network_name" {
  description = "The name of the virtual network that contains the subnet."
}

variable "resource_group_name" {
  description = "The name of the resource group that contains the subnet."
}

variable "nsg_name" {
  description = "The name of the network security group to associate with the subnet."
}