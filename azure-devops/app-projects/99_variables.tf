variable "dev_subscription_name" {
  type        = string
  description = "DEV Subscription name"
}


variable "uat_subscription_name" {
  type        = string
  description = "UAT Subscription name"
}

variable "prod_subscription_name" {
  type        = string
  description = "PROD Subscription name"
}

variable "project_name_prefix" {
  type        = string
  description = "Project name prefix (e.g. userregistry)"
}

locals {
  prefix           = "dvopau"
  azure_devops_org = "pagopaspa"

  # 🔐 KV
  prod_key_vault_azdo_name = "${local.prefix}-p-azdo-neu-kv"

  prod_key_vault_name = "${local.prefix}-p-neu-kv"

  prod_key_vault_resource_group = "${local.prefix}-p-sec-rg"

  # ☁️ VNET
  prod_vnet_rg = "${local.prefix}-p-vnet-rg"

  # 📦 ACR PROD DOCKER
  srv_endpoint_name_docker_registry_prod = "${local.prefix}-acr_docker_registry_prod"
  docker_registry_rg_name_prod           = "${local.prefix}-p-docker-rg"
  docker_registry_name_prod              = "${local.prefix}pacr"

  #tfsec:ignore:general-secrets-no-plaintext-exposure
  #tfsec:ignore:GEN002
  tlscert_renew_token = "v1"
}
