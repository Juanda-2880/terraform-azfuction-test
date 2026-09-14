# Provider configuration
provider "azurerm" {
  features {}
}

# Resource group hosting the infrastructure
resource "azurerm_resource_group" "rg" {
  name     = var.name_function
  location = var.location
  tags     = var.tags
}

# Reusable module for Azure Function App infrastructure
module "function_app" {
  source = "./modules/function_app"

  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  function_name        = var.name_function
  storage_account_name = var.storage_account_name
  function_source_file = "${path.module}/example/index.js"
  tags                 = var.tags
}
