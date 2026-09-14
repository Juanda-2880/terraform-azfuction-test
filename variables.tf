variable "name_function" {
  type        = string
  description = "Unique base name for the Function App and associated infrastructure resources."
}

variable "location" {
  type        = string
  default     = "Mexico Central"
  description = "Azure region where the resources will be deployed."
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment environment identifier (e.g., dev, staging, prod)."
}

variable "storage_account_name" {
  type        = string
  default     = null
  description = "Custom name for the Storage Account (3-24 lowercase alphanumeric characters). Derived automatically if left null."
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "azure-function-test"
  }
  description = "Resource tags applied to all provisioned infrastructure."
}