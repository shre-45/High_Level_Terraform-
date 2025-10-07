vnet_name               = "dev-vnet"
vnet_address_space      = ["10.0.0.0/16"]
subnets = [
  { name = "subnet1", address_prefix = "10.0.1.0/24" },
  { name = "subnet2", address_prefix = "10.0.2.0/24" }
]

vm_name                = "dev-vm"
vm_size                = "Standard_B2s"
location               = "EastUS"
admin_username         = "azureuser"

storage_account_name   = "devstorageacct0001"
account_tier             = "Standard"
account_replication_type = "LRS"

resource_group_name    = "dev-rg"
publisher              = "Canonical"
offer                  = "0001-com-ubuntu-server-focal"
sku                    = "20_04-lts"
image_version          = "latest"
caching                = "ReadWrite"
storage_account_type   = "Standard_LRS"
priority                    = 102
direction                   = "Inbound"
access                      = "Allow"
protocol                    = "Tcp"
source_port_range           = "*"
destination_port_range      = "22"
source_address_prefix       = "*"
destination_address_prefix  = "*"

keyvault_name       = "demo-kv601"
service_principal_name = "demo-sp"
enabled_for_disk_encryption = "true"
purge_protection_enabled    = "false"
soft_delete_retention_days  = "7"
enable_rbac_authorization   = "true"
sku_name                    = "premium"