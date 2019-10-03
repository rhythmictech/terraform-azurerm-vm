resource "azurerm_resource_group" "main" {
  name     = "example-rg"
  location = "eastus"
}

resource "azurerm_virtual_network" "main" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = "example-net"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.2.0/24"
}

module "vm" {
  source = "../.."

  name                = "example"
  resource_group_name = azurerm_resource_group.main.name
  vnet_name           = azurerm_virtual_network.main.name
  subnet_name         = azurerm_subnet.main.name
}
