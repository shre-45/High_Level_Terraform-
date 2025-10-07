data "azuread_client_config" "current" {}

# Azure AD Application
resource "azuread_application" "app" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

# Service Principal
resource "azuread_service_principal" "sp" {
  client_id = azuread_application.app.client_id
  owners    = [data.azuread_client_config.current.object_id]
}

# Service Principal Password (Client Secret)
resource "azuread_service_principal_password" "sp_secret" {
  service_principal_id = azuread_service_principal.sp.id
  
}

