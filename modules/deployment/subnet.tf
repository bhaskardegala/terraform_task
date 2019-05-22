resource "azurerm_subnet" "tomcat" {
  name                 = "${var.first}-sub1"
  address_prefix       = "10.0.1.0/24"
  resource_group_name  = "${azurerm_resource_group.trail.name}"
  virtual_network_name = "${azurerm_virtual_network.trail.name}"
}
