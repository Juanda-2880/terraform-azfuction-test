locals {
  # Azure Storage Account naming requires 3-24 alphanumeric characters, lowercase only
  derived_storage_name = substr(lower(replace(var.function_name, "/[^a-zA-Z0-9]/", "")), 0, 24)
  storage_account_name = coalesce(var.storage_account_name, local.derived_storage_name)
  service_plan_name    = coalesce(var.service_plan_name, "${var.function_name}-sp")
  function_name        = coalesce(var.function_app_function_name, var.function_name)
}

resource "azurerm_storage_account" "sa" {
  name                     = local.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_replication_type
  tags                     = var.tags
}

resource "azurerm_service_plan" "sp" {
  name                = local.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_windows_function_app" "wfa" {
  name                = var.function_name
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  service_plan_id            = azurerm_service_plan.sp.id

  site_config {
    application_stack {
      node_version = var.node_version
    }
  }

  tags = var.tags
}

resource "azurerm_function_app_function" "faf" {
  name            = local.function_name
  function_app_id = azurerm_windows_function_app.wfa.id
  language        = "Javascript"

  file {
    name    = "index.js"
    content = file(var.function_source_file)
  }

  test_data = jsonencode({
    "name" = "Azure"
  })

  config_json = jsonencode({
    "bindings" : [
      {
        "authLevel" : "anonymous",
        "type" : "httpTrigger",
        "direction" : "in",
        "name" : "req",
        "methods" : [
          "get",
          "post"
        ]
      },
      {
        "type" : "http",
        "direction" : "out",
        "name" : "res"
      }
    ]
  })
}

