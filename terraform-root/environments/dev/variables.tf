variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "service_principal_name" {
  type        = string
  description = "Service Principal name"
}

variable "subscription_id" {
  description = "Target Azure subscription ID"
  type        = string
}

variable "keyvault_name" {
  type        = string
  description = "Azure Key Vault name"
}

variable "admin_password" {
  type        = string
  description = "VM admin password (to be stored in Key Vault)"
  sensitive   = true
}

# VNet variables
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "subnets" {
  description = "List of subnets with name and address prefix"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "priority" {
  description = "The priority of the network security rule."
  type        = number
}

variable "direction" {
  description = "The direction of network traffic (Inbound or Outbound)."
  type        = string
}

variable "access" {
  description = "Whether the network rule allows or denies traffic."
  type        = string
}

variable "protocol" {
  description = "The protocol to which the rule applies (TCP, UDP, or *)."
  type        = string
}

variable "source_port_range" {
  description = "The source port or range of ports for the network rule."
  type        = string
}

variable "destination_port_range" {
  description = "The destination port or range of ports for the network rule."
  type        = string
}

variable "source_address_prefix" {
  description = "The source address or CIDR range for the network rule."
  type        = string
}

variable "destination_address_prefix" {
  description = "The destination address or CIDR range for the network rule."
  type        = string
}

# VM variables
variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the Virtual Machine."
  type        = string
}

variable "publisher" {
  description = "The publisher of the image to use for the VM."
  type        = string
}

variable "offer" {
  description = "The offer of the image to use for the VM."
  type        = string
}

variable "sku" {
  description = "The SKU of the image to use for the VM."
  type        = string
}

variable "image_version" {
  description = "The version of the image to use (e.g., latest)."
  type        = string
}

variable "caching" {
  description = "The caching type for the OS disk (e.g., ReadWrite, ReadOnly, None)."
  type        = string
}

variable "storage_account_type" {
  description = "The storage account type for the OS disk (e.g., Standard_LRS, Premium_LRS)."
  type        = string
}

variable "account_tier" {
  description = "The performance tier of the storage account (e.g., Standard, Premium)."
  type        = string
}

variable "account_replication_type" {
  description = "The replication type for the storage account (e.g., LRS, GRS)."
  type        = string
}

# Storage variables
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  
}

#keyvault variables
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


