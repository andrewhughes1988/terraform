terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform_RG"
  location = "eastus"
  tags = {
  Department = "Terraform" }
}

resource "azurerm_virtual_network" "vnetTF" {
  name                = "vnetTF"
  address_space       = ["10.0.0.0/8"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    Department = "Terraform"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnetTF.name
  address_prefixes     = ["10.0.1.0/24"]
}