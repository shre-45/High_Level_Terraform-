resource "azurerm_public_ip" "myVMIP" {
  name                = "${var.vm_name}-01"
  resource_group_name =  var.resource_group_name
  location            =  var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myVMIP.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.nic.id]


 
  # OPTIONAL: source image
  source_image_reference {
    publisher = "${var.publisher}"
    offer     = "${var.offer}"
    sku       = "${var.sku}"
    version   = "${var.image_version}"
  }

# REQUIRED: OS Disk
  os_disk {
    caching           = "${var.caching}"
    storage_account_type = "${var.storage_account_type}"
  }
  disable_password_authentication = false
    
}