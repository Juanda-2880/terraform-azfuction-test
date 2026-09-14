output "url" {
  value       = module.function_app.function_invocation_url
  sensitive   = false
  description = "HTTP invocation URL for the deployed Azure Function."
}

output "function_invocation_url" {
  value       = module.function_app.function_invocation_url
  sensitive   = false
  description = "Full HTTP trigger invocation URL for the deployed Azure Function."
}

output "function_app_name" {
  value       = module.function_app.function_app_name
  description = "The name of the provisioned Azure Windows Function App."
}

output "function_app_default_hostname" {
  value       = module.function_app.function_app_default_hostname
  description = "The default hostname of the Function App."
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the Azure Resource Group."
}

output "storage_account_name" {
  value       = module.function_app.storage_account_name
  description = "The name of the Storage Account backing the Function App."
}