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

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_api_management" "apim" {
  name                = var.azurerm_api_management
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_api_management_api" "myapi" {
  name                = var.azurerm_api_management_api
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
  api_management_name = data.azurerm_api_management.apim.name
  revision            = "1"
  path                = "loop"
  protocols           = ["https"]
  display_name        = "test-api-loop-dn"
}

resource "azurerm_api_management_api_operation" "myapio" {
  api_name            = azurerm_api_management_api.myapi.name
  api_management_name = data.azurerm_api_management.apim.name
  resource_group_name = data.azurerm_resource_group.rg.name
  for_each = var.apis
  operation_id        = each.value["operation_id"]
  display_name = each.value["display_name"]
  method = each.value["method"]
  url_template = each.value["url_template"]
}

