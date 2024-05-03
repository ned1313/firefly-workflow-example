# Provider: AzureRM
provider "azurerm" {
  features {}
  use_oidc = true

}

variable "environment" {
  type        = string
  description = "Environment value to use for tagging resources"
}

variable "location" {
  type        = string
  description = "Location value to use for Azure resources"
}

variable "prefix" {
  type        = string
  description = "Prefix value to use for Azure resources"
}

module "vnet" {
  source      = "../"
  environment = var.environment
  location    = var.location
  prefix      = var.prefix
}