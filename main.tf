# Randmon ID for resource group
resource "random_integer" "main" {
  min = 10000
  max = 99999
}

locals {
  resource_group_name = "${var.prefix}-${var.environment}-${random_integer.main.result}"
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.location
  tags = {
    environment = var.environment
    version     = "1.3"
  }
}

# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = [var.vnet_address_space]

  tags = {
    environment = var.environment
  }
}

# Subnets
resource "azurerm_subnet" "main" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value]
}
