variable "resource_group_name" {
  type        = string
  description = "The name of the target resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be provisioned."
  default     = "Mexico Central"
}

variable "function_name" {
  type        = string
  description = "The base name for the Function App and related resources."
}

variable "function_app_function_name" {
  type        = string
  description = "The specific name of the HTTP function within the Function App. Defaults to function_name if null."
  default     = null
}

variable "storage_account_name" {
  type        = string
  description = "Optional explicit name for the Storage Account (must be 3-24 alphanumeric characters, lowercase only). If omitted, an alphanumeric representation derived from function_name is used."
  default     = null
}

variable "service_plan_name" {
  type        = string
  description = "Optional explicit name for the Service Plan. If omitted, defaults to {function_name}-sp."
  default     = null
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account tier (e.g., Standard or Premium)."
  default     = "Standard"
}

variable "storage_replication_type" {
  type        = string
  description = "Storage account replication strategy (e.g., LRS, GRS)."
  default     = "LRS"
}

variable "os_type" {
  type        = string
  description = "Operating system type for the App Service Plan."
  default     = "Windows"
}

variable "sku_name" {
  type        = string
  description = "SKU for the Service Plan (e.g., Y1 for consumption)."
  default     = "Y1"
}

variable "node_version" {
  type        = string
  description = "Node.js version for the application stack."
  default     = "~18"
}

variable "function_source_file" {
  type        = string
  description = "Path to the JavaScript source file for the function."
  default     = "example/index.js"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to assign to the provisioned resources."
  default     = {}
}

