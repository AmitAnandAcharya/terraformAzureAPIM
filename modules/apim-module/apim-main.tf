terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

resource "azurerm_api_management" "myapim" {
  name                = var.az_api_management
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  publisher_name      = var.company
  publisher_email     = var.email
  sku_name            = var.sku
}

