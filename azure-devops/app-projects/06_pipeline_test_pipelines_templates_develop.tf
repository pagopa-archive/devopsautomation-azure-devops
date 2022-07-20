variable "test-pipelines-templates-develop" {
  default = {
    repository = {
      organization    = "pagopa"
      name            = "azure-pipeline-templates"
      branch_name     = "refs/heads/main"
      pipelines_path  = ".devops"
      pipeline_yml_filename = "test-pipelines.yaml"
    }
    pipeline = {
      enable_code_review = true
      enable_deploy      = true
      name                = "test-pipelines-templates-develop"
      path               = "\\azure-pipeline-templates\test-pipelines-templates-develop"
    }
  }
}

locals {
  # global vars
  test-pipelines-templates-develop-variables = {
    dockerfile = "Dockerfile"
  }
  # global secrets
  test-pipelines-templates-develop-variables_secret = {

  }
  # code_review vars
  test-pipelines-templates-develop-variables_code_review = {
    sonarcloud_service_conn = "SONARCLOUD-SERVICE-CONN"
    sonarcloud_org          = var.test-pipelines-templates-develop.repository.organization
    sonarcloud_project_key  = "${var.test-pipelines-templates-develop.repository.organization}_${var.test-pipelines-templates-develop.repository.name}"
    sonarcloud_project_name = var.test-pipelines-templates-develop.repository.name
  }
  # code_review secrets
  test-pipelines-templates-develop-variables_secret_code_review = {

  }
  # deploy vars
  test-pipelines-templates-develop-variables_deploy = {
  }
  # deploy secrets
  test-pipelines-templates-develop-variables_secret_deploy = {

  }
}

module "test-pipelines-templates-develop_test" {
  source = "git::https://github.com/pagopa/azuredevops-tf-modules.git//azuredevops_build_definition_deploy?ref=add-module-build-pipeline-generic"
  count  = var.test-pipelines-templates-develop.pipeline.enable_deploy == true ? 1 : 0

  project_id                   = data.azuredevops_project.project.id
  repository                   = var.test-pipelines-templates-develop.repository
  github_service_connection_id = local.service_endpoint_io_azure_devops_github_pr_id
  
  path                         = var.test-pipelines-templates-develop.pipeline.path
  pipeline_name                 = var.test-pipelines-templates-develop.pipeline.name
  pipeline_yml_filename = var.test-pipelines-templates-develop.repository.pipeline_yml_filename

  ci_trigger_use_yaml = true

  variables = merge(
    local.test-pipelines-templates-develop-variables,
    local.test-pipelines-templates-develop-variables_deploy,
  )

  variables_secret = merge(
    local.test-pipelines-templates-develop-variables_secret,
    local.test-pipelines-templates-develop-variables_secret_deploy,
  )

  service_connection_ids_authorization = [
    local.service_endpoint_io_azure_devops_github_pr_id,

    local.service_endpoint_azure_dev_id,
    local.service_endpoint_azure_devops_acr_aks_dev_id,
    azuredevops_serviceendpoint_kubernetes.aks_dev.id
  ]
}
