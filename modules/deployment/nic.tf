resource "azurerm_network_interface" "tomcat" {
  name                      = "${var.first}-ani"
  location                  = "${azurerm_resource_group.trail.location}"
  resource_group_name       = "${azurerm_resource_group.trail.name}"
  network_security_group_id = "${azurerm_network_security_group.tomcat.id}"

  ip_configuration {
    subnet_id                     = "${azurerm_subnet.tomcat.id}"
    name                          = "tomcatip"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.tomcat.id}"
  }
}


