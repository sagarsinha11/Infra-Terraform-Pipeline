terraform {
  #required_version = "1.12.2"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateb17g13"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "86c2c7ab-0841-425a-9004-95c83c2075de" 
}