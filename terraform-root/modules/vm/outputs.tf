
output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.myVMIP.ip_address
}