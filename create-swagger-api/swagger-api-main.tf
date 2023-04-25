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
  path                = "swagger"
  protocols           = ["https"]
  display_name        = "test-api-swagger-dn"

  import {
    content_format = "swagger-json"
    content_value = file("${path.module}/sample-swagger.json")
  }
}


