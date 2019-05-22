resource "azurerm_public_ip" "tomcat" {
  location            = "central us"
  name                = "vm-1-publicip"
  resource_group_name = "${azurerm_resource_group.trail.name}"
  allocation_method   = "Dynamic"
}