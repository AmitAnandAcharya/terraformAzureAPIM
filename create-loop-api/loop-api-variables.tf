variable "resource_group_name" {
  default = "testResourceGroup"
}

variable "azurerm_api_management" {
  default = "test-apim-instance-01"
}

variable "azurerm_api_management_api" {
  default = "test-api-loop"
}


variable "apis" {
  type = map(object({
    operation_id = string
    display_name = string
    method = string
    url_template = string
  }))
  default = {
    "1" = {
      operation_id = "operation1"
      display_name = "GET resource1"
      method = "GET"
      url_template = "/resource1"
    }
    "2" = {
      operation_id = "operation2"
      display_name = "POST resource2"
      method = "POST"
      url_template = "/resource2"
    }
  }
}