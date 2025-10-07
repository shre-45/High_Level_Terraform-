resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  purge_protection_enabled    = var.purge_protection_enabled
  soft_delete_retention_days  = var.soft_delete_retention_days
  enable_rbac_authorization   = var.enable_rbac_authorization

}

# Assign RBAC role to Service Principal (so it can use secrets)
resource "azurerm_role_assignment" "sp_kv_role" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.sp_object_id
}
