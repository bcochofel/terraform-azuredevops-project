output "proj_name" {
  value = azuredevops_project.proj.name
}

output "proj_id" {
  value = azuredevops_project.proj.id
}

output "ghsc_name" {
  value = azuredevops_serviceendpoint_github.gh.service_endpoint_name
}

output "vg_name" {
  value = azuredevops_variable_group.vg.name
}

output "vg_id" {
  value = azuredevops_variable_group.vg.id
}
