variable "keyvault_name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region where Key Vault will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
  type        = string
}

variable "sp_object_id" {
  description = "Object ID of the Service Principal that needs access to Key Vault"
  type        = string
}

variable "enabled_for_disk_encryption" {
  description = "Specifies whether disk encryption is enabled for the Key Vault."
  type        = bool
}

variable "purge_protection_enabled" {
  description = "Specifies whether purge protection is enabled for the Key Vault. Once enabled, this cannot be disabled."
  type        = bool
}

variable "soft_delete_retention_days" {
  description = "Number of days that items should be retained after soft delete before permanent deletion."
  type        = number
 
}

variable "enable_rbac_authorization" {
  description = "Specifies whether the Key Vault uses role-based access control (RBAC) for authorization."
  type        = bool

}

variable "sku_name" {
  description = "Specifies sku_name."
  type        = string

}