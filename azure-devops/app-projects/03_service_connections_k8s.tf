# # 🟢 DEV service connection for azure kubernetes service
# resource "azuredevops_serviceendpoint_kubernetes" "aks-dev" {
#   depends_on            = [azuredevops_project.project]
#   project_id            = azuredevops_project.project.id
#   service_endpoint_name = "${local.prefix}-aks-dev"
#   apiserver_url         = module.secret_azdo_dev.values["aks-apiserver-url"].value
#   authorization_type    = "ServiceAccount"
#   service_account {
#     # base64 values
#     token   = module.secret_azdo_dev.values["aks-azure-devops-sa-token"].value
#     ca_cert = module.secret_azdo_dev.values["aks-azure-devops-sa-cacrt"].value
#   }
# }

# # 🟨 UAT service connection for azure kubernetes service
# resource "azuredevops_serviceendpoint_kubernetes" "aks-uat" {
#   depends_on            = [azuredevops_project.project]
#   project_id            = azuredevops_project.project.id
#   service_endpoint_name = "${local.prefix}-aks-uat"
#   apiserver_url         = module.secret_azdo_uat.values["aks-apiserver-url"].value
#   authorization_type    = "ServiceAccount"
#   service_account {
#     # base64 values
#     token   = module.secret_azdo_uat.values["aks-azure-devops-sa-token"].value
#     ca_cert = module.secret_azdo_uat.values["aks-azure-devops-sa-cacrt"].value
#   }
# }

# # 🛑 PROD service connection for azure kubernetes service
# resource "azuredevops_serviceendpoint_kubernetes" "aks-prod" {
#   depends_on            = [azuredevops_project.project]
#   project_id            = azuredevops_project.project.id
#   service_endpoint_name = "${local.prefix}-aks-prod"
#   apiserver_url         = module.secret_azdo_prod.values["aks-apiserver-url"].value
#   authorization_type    = "ServiceAccount"
#   service_account {
#     # base64 values
#     token   = module.secret_azdo_prod.values["aks-azure-devops-sa-token"].value
#     ca_cert = module.secret_azdo_prod.values["aks-azure-devops-sa-cacrt"].value
#   }
# }
