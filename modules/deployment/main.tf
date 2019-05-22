provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
}

resource "azurerm_resource_group" "trail" {
  name     = "${var.first}-resource"
  location = "${var.location}"
}

output "tomcat_link" {
  value = "{http://${azurerm_public_ip.tomcat.ip_address}:8080}" 
}

output "details" {
  value = "This is the link to open tomcat, username and password for you manage apps in tomcat are 'ansible' 'password' "
}