# create project
resource "azuredevops_project" "proj" {
  name               = var.proj_name
  description        = var.proj_description
  visibility         = var.proj_visibility
  version_control    = var.proj_vcs
  work_item_template = var.proj_wi_template
  features           = var.proj_features
}

# create github service connection
resource "azuredevops_serviceendpoint_github" "gh" {
  project_id            = azuredevops_project.proj.id
  service_endpoint_name = var.github_serviceendpoint_name
  description           = var.github_serviceendpoint_description

  auth_personal {
    personal_access_token = var.github_pat
  }
}

# create variable group
resource "azuredevops_variable_group" "vg" {
  project_id   = azuredevops_project.proj.id
  name         = var.vg_name
  description  = var.vg_description
  allow_access = var.vg_allow_access

  dynamic "variable" {
    for_each = var.vg_variables
    content {
      name      = variable.value["name"]
      value     = variable.value["value"]
      is_secret = variable.value["is_secret"]
    }
  }
}
