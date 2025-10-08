



resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


data "azurerm_client_config" "current" {}

module "service-principal" {
  source                 = "../../modules/service-principal"
  service_principal_name = var.service_principal_name
  subscription_id        = data.azurerm_client_config.current.subscription_id
}

module "keyvault" {
  source              = "../../modules/keyvault"
  keyvault_name       = var.keyvault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sp_object_id        = module.service-principal.service_principal_object_id
  sku_name                    = var.sku_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  purge_protection_enabled    = var.purge_protection_enabled
  soft_delete_retention_days  = var.soft_delete_retention_days
  enable_rbac_authorization   = var.enable_rbac_authorization
}

# Assign Terraform SP full access to Key Vault
# -------------------------------
resource "azurerm_role_assignment" "terraform_kv_access" {
  scope                = module.keyvault.keyvault_id
  role_definition_name = "Key Vault Administrator"  # allows get/set secrets
  principal_id         = data.azurerm_client_config.current.object_id
}

# Store Service Principal Client Secret in Key Vault
resource "azurerm_key_vault_secret" "sp_secret" {
  name         = "sp-client-secret"
  value        = module.service-principal.client_secret
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault.kv_role_assignment,
    azurerm_role_assignment.terraform_kv_access
  ]
}

# Store VM password in Key Vault
resource "azurerm_key_vault_secret" "admin_password" {
  name         = "dev-vm-password"
  value        = var.admin_password   # coming from variables.tf
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault.kv_role_assignment,
    azurerm_role_assignment.terraform_kv_access
  ]
}

# Pull VM password from Key Vault
data "azurerm_key_vault_secret" "admin_password" {
  name         = "dev-vm-password"
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    azurerm_key_vault_secret.admin_password
  ]
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  subnets             = var.subnets
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
}



module "vm" {
  source               = "../../modules/vm"
  vm_name              = var.vm_name
  resource_group_name  = azurerm_resource_group.rg.name
  vm_size              = var.vm_size
  location             = var.location
  admin_username       = var.admin_username
  admin_password       = data.azurerm_key_vault_secret.admin_password.value
  subnet_id            = module.vnet.subnet_ids[0]
  publisher            = var.publisher
  offer                = var.offer
  sku                  = var.sku
  image_version        = var.image_version
  caching              = var.caching
  storage_account_type = var.storage_account_type
}

module "storage" {
  source               = "../../modules/storage"
  storage_account_name = var.storage_account_name
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
