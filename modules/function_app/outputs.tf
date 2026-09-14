output "function_invocation_url" {
  value       = azurerm_function_app_function.faf.invocation_url
  description = "The invocation URL of the deployed HTTP function."
}

output "function_app_id" {
  value       = azurerm_windows_function_app.wfa.id
  description = "The ID of the Windows Function App."
}

output "function_app_name" {
  value       = azurerm_windows_function_app.wfa.name
  description = "The name of the Windows Function App."
}

output "function_app_default_hostname" {
  value       = azurerm_windows_function_app.wfa.default_hostname
  description = "The default hostname associated with the Function App."
}

output "storage_account_id" {
  value       = azurerm_storage_account.sa.id
  description = "The ID of the provisioned Storage Account."
}

output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "The name of the provisioned Storage Account."
}

output "service_plan_id" {
  value       = azurerm_service_plan.sp.id
  description = "The ID of the App Service Plan."
}

