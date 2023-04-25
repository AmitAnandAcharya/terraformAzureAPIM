# Configure the Azure provider
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
  features {}
}

module "apim_module" {
    source = "../modules/apim-module"
    rg_name = var.resource_group_name
    az_api_management = var.azurerm_api_management
    company = var.company
    email = var.email
    sku = var.sku
}