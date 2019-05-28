resource "azurerm_virtual_machine" "tomcat" {
  name                  = "${var.first}-vm"
  resource_group_name   = "${azurerm_resource_group.trail.name}"
  location              = "${azurerm_resource_group.trail.location}"
  vm_size               = "Standard_B1s"
  network_interface_ids = ["${azurerm_network_interface.tomcat.id}"]

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  delete_os_disk_on_termination = true

  os_profile {
    computer_name  = "tomcat"
    admin_username = "${var.username_tomcat_vm}"
    admin_password = "${var.password_tomcat_vm}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  connection {
    type     = "ssh"
    user     = "${var.username_tomcat_vm}"
    password = "${var.password_tomcat_vm}"
  }

  provisioner "file" {
    source      = "./modules/deployment/tomcat.yml"
    destination = "/home/${var.username_tomcat_vm}/tomcat.yml"
  }

  provisioner "file" {
    source      = "./modules/deployment/tomcatrestart.yml"
    destination = "/home/${var.username_tomcat_vm}/tomcatrestart.yml"
  }

  provisioner "file" {
    source      = "./modules/deployment/tomcat"
    destination = "/home/${var.username_tomcat_vm}/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install software-properties-common -y",
      "sudo apt-add-repository --yes --update ppa:ansible/ansible",
      "sudo apt-get install ansible -y",
      "sudo mv /home/${var.username_tomcat_vm}/tomcat /etc/ansible/roles/",
      "ansible-playbook /home/${var.username_tomcat_vm}/tomcat.yml",
      "sudo wget ${var.war_link}",
      "sudo mv /home/${var.username_tomcat_vm}/*.war /opt/tomcat/webapps/",
      "ansible-playbook /home/${var.username_tomcat_vm}/tomcatrestart.yml"
    ]
  }
}
