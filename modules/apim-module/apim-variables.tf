variable "rg_name" {
    type = string
    description = "resource group name"
}

variable "az_api_management" {
    type = string
    description = "azure apim name"
}

variable "company" {
    type = string
    description = "name of the organization"
}

variable "email" {
    default = "amacharya@deloitte.com"
    type = string
    description = "email id"
}

variable "sku" {
    type = string
    description = "sku capacity"
}