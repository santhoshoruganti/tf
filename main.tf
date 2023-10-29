# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "pocResourceGroup" {
  name     = "RG-EUR-DE-POC-Santhosh"
  location = "West Europe"
}

resource "azurerm_storage_account" "pocStorage" {
  name                     = "sageurwwdemo"
  resource_group_name      = azurerm_resource_group.pocResourceGroup.name
  location                 = azurerm_resource_group.pocResourceGroup.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "POC"
  }
}