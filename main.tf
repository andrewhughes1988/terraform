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
}