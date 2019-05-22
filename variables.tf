variable "client_id" {
  type        = "string"
  description = "Please enter your Client id"
}

variable "client_secret" {
  type        = "string"
  description = "Please enter your Client secret"
}

variable "subscription_id" {
  type        = "string"
  description = "Please enter your Subscription id"
}

variable "tenant_id" {
  type        = "string"
  description = "Please enter your Tenant id"
}

variable "location" {
  type        = "string"
  description = "Enter location where you would you like create your VM"
}

variable "username_tomcat_vm" {
  type        = "string"
  description = "Please enter username which can used as user credentials for your VM"
}

variable "password_tomcat_vm" {
  type        = "string"
  description = "Please enter password which can used as user credentials for your VM and password should contain lower,upper case ,numeric and special character"
}

variable "war_link" {
  type        = "string"
  description = "Please provide downloadable link of your war file"
}
