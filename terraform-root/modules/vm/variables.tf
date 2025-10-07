variable "vm_name" {
  description = "The name of the Virtual Machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the VM will be created."
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine (e.g., Standard_DS1_v2)."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the Virtual Machine."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the Virtual Machine."
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "The ID of the subnet where the VM will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the VM will be deployed (e.g., eastus)."
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

