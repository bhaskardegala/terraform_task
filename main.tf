module "deployment" {
  source             = "./modules/deployment/"
  client_id          = "${var.client_id}"
  client_secret      = "${var.client_secret}"
  subscription_id    = "${var.subscription_id}"
  tenant_id          = "${var.tenant_id}"
  location           = "${var.location}"
  username_tomcat_vm = "${var.username_tomcat_vm}"
  password_tomcat_vm = "${var.password_tomcat_vm}"
  war_link           = "${var.war_link}"
}

output "Tomcat_link" {
  value = "${module.deployment.tomcat_link}"
}

output "NOTE" {
  value = "${module.deployment.details}"
}
