resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  count               = length(var.subnets)
  name                = var.subnets[count.index].name
  resource_group_name = var.resource_group_name
  virtual_network_name= azurerm_virtual_network.vnet.name
  address_prefixes    = [var.subnets[count.index].address_prefix]
}

resource "azurerm_network_security_group" "nsg1" {
  name                = "${var.vnet_name}-nsg1"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
}

resource "azurerm_network_security_rule" "ssh" {
  name                        = "ssh"
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${azurerm_network_security_group.nsg1.name}"
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc" {
  subnet_id                 = azurerm_subnet.subnet[0].id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}