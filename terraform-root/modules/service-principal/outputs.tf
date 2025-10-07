output "service_principal_object_id" {
  description = "Object ID of the Service Principal"
  value       = azuread_service_principal.sp.object_id
}

output "client_id" {
  description = "Client ID of the Service Principal"
  value       = azuread_service_principal.sp.client_id
}

output "client_secret" {
  description = "Client Secret of the Service Principal"
  value       = azuread_service_principal_password.sp_secret.value
  sensitive   = true
}
