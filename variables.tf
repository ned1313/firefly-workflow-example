variable "environment" {
  type        = string
  description = "Environment value to use for tagging resources"
}

variable "location" {
  type        = string
  description = "Location value to use for Azure resources"
  default     = "eastus"
}

variable "prefix" {
  type        = string
  description = "Prefix value to use for Azure resources"
  default     = "taco"
}

variable "vnet_address_space" {
  type = string
  description = "Address space for the virtual network"
}

variable "subnets" {
  type = map(string)
  description = "Subnets to create in the virtual network"
}