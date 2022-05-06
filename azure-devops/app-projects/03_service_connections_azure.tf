#
# ⛩ Service connections
#

# 🛑 PROD service connection
resource "azuredevops_serviceendpoint_azurerm" "PROD-SERVICE-CONN" {
  depends_on = [azuredevops_project.project]

  project_id                = azuredevops_project.project.id
  service_endpoint_name     = "${var.prod_subscription_name}-SERVICE-CONN"
  description               = "${var.prod_subscription_name} Service connection"
  azurerm_subscription_name = var.prod_subscription_name
  azurerm_spn_tenantid      = module.secret_azdos.values["TENANTID"].value
  azurerm_subscription_id   = module.secret_azdos.values["PROD-SUBSCRIPTION-ID"].value
}
