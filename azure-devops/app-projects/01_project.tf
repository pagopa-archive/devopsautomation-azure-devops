resource "azuredevops_project" "project" {
  name               = "devopsautomation-projects"
  description        = "This is the DevOps project for devop team projects"
  visibility         = "public"
  version_control    = "Git"
  work_item_template = "Basic"
}

resource "azuredevops_project_features" "project_features" {
  project_id = azuredevops_project.project.id
  features = {
    "pipelines"    = "enabled"
    "boards"       = "disabled"
    "repositories" = "disabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}
