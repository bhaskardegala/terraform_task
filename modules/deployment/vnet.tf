resource "azurerm_virtual_network" "trail" {
  name                = "${var.first}-vnet1"
  location            = "${azurerm_resource_group.trail.location}"
  resource_group_name = "${azurerm_resource_group.trail.name}"
  address_space       = ["10.0.0.0/16"]
}
