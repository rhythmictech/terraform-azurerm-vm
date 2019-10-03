
# =============================================
# main
# =============================================

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "azurerm_network_interface" "this" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.name}-ipconfig"
    subnet_id                     = local.bastion_subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.common_tags
}

resource "azurerm_virtual_machine" "this" {
  name                  = "${var.name}-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.this.id]
  vm_size               = var.vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_os_disk {
    name          = "${var.name}-disc"
    create_option = "FromImage"
  }

  storage_image_reference {
    publisher = var.storage_image_reference.publisher
    offer     = var.storage_image_reference.offer
    sku       = var.storage_image_reference.sku
    version   = var.storage_image_reference.version
  }

  os_profile {
    computer_name  = "${var.name}host"
    admin_username = local.admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      key_data = replace(local.ssh_key, "\n", "")
      path     = "/home/${local.admin_username}/.ssh/authorized_keys"
    }
  }

  tags = local.common_tags
}
