output "ssh_key" {
  description = "ssh private key to reach server"
  value       = local.ssh_key
}

output "vm" {
  description = "vm resource object"
  value       = azurerm_virtual_machine.this
}

output "nic" {
  description = "nic resource object"
  value       = azurerm_network_interface.this
}
