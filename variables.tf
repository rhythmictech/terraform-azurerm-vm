# =============================================
# Required
# =============================================

variable "name" {
  description = "Moniker to apply to all resources in the module"
  type        = string
}
variable "resource_group_name" {
  description = "Resource Group for bastion server"
  type        = string
}

variable "vnet_name" {
  description = "VNET containing subnet for bastion server"
  type        = string
}

variable "subnet_name" {
  description = "Subnet for bastion server"
  type        = string
}

# =============================================
# Optional
# =============================================

variable "assign_public_ip" {
  description = "If true then assigns a public IP to the VM"
  type        = bool
  default     = false
}

variable "public_ip_allocation_method" {
  description = "Static or Dynamic"
  type        = string
  default     = "Static"
}

variable "private_ip_address_allocation" {
  description = "Static or Dynamic"
  type        = string
  default     = "Static"
}

variable "location" {
  description = "Azure Location for Resources"
  type        = string
  default     = "eastus"
}

variable "storage_image_reference" {
  description = "storage_image_reference to specify VM image"
  type        = map(string)
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}

variable "tags" {
  description = "User-Defined tags"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment to tag resources with"
  type        = string
  default     = "default"
}

variable "vm_size" {
  description = "VM size for bastion server, see docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes-general"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "ssh_key" {
  description = "Optional SSH key for VM"
  type        = string
  default     = ""
}

# =============================================
# data/locals
# =============================================

data "azurerm_subscription" "current" {}

locals {
  create_ssh_key = var.ssh_key == ""
  ssh_key        = var.ssh_key != "" ? var.ssh_key : tls_private_key.ssh.public_key_openssh
  subnet_id      = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/virtualNetworks/${var.vnet_name}/subnets/${var.subnet_name}"
  admin_username = "${var.name}user"
}
