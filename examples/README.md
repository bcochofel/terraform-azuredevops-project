# Bootstrap Azure DevOps Project and Terraform remote backend

This example bootstraps Azure DevOps Project with variable group with
Terraform secrets so it can be used on pipelines.

This module creates the following resources:

* Resource Group (AzureRM)
* Storage Account (AzureRM)
* Storage Container (AzureRM)
* Key Vault (AzureRM)
* Azure DevOps Project
* Variable Group
* GitHub Service Connection

The variable group can be used for Terraform pipelines to inject Environment Variables needed for
provider authentication (currently has all the env vars needed for both AzureRM and AzureDevOps providers besides
the secrets that must be added manually to a different variable group).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | ~> 0.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.41.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | ~> 2.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | ~> 0.1.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.41.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module\_project) | ../ |  |
| <a name="module_rg"></a> [rg](#module\_rg) | bcochofel/resource-group/azurerm | 1.4.1 |
| <a name="module_st"></a> [st](#module\_st) | bcochofel/storage-account/azurerm | 1.1.0 |

## Resources

| Name | Type |
|------|------|
| [azuread_group.kv](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |
| [azurerm_key_vault.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.kvusers](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.sp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azuredevops_client_config.current](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/client_config) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_pat"></a> [github\_pat](#input\_github\_pat) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | <pre>{<br>  "Environment": "Management",<br>  "ManagedBy": "Terraform",<br>  "Project": "DemoLab"<br>}</pre> | no |
| <a name="input_users_object_ids"></a> [users\_object\_ids](#input\_users\_object\_ids) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
