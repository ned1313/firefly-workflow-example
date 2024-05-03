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

variable "vnet_address_space" {
  type = string
  description = "Address space for the virtual network"
}

variable "subnets" {
  type = map(string)
  description = "Subnets to create in the virtual network"
}

module "vnet" {
  source      = "../"
  environment = var.environment
  location    = var.location
  prefix      = var.prefix
  vnet_address_space = var.vnet_address_space
  subnets = var.subnets
}