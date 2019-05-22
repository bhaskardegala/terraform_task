resource "azurerm_network_security_group" "tomcat" {
  name                = "${var.first}-nsg"
  location            = "${azurerm_resource_group.trail.location}"
  resource_group_name = "${azurerm_resource_group.trail.name}"
}

resource "azurerm_network_security_rule" "tomcat_in" {
  name                        = "${var.first}-rule"
  direction                   = "inbound"
  priority                    = "1000"
  protocol                    = "tcp"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  access                      = "allow"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = "${azurerm_resource_group.trail.name}"
  network_security_group_name = "${azurerm_network_security_group.tomcat.name}"
}

