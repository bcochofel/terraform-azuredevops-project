# Bootstrap Azure DevOps Project and Terraform remote backend

This example bootstraps Azure DevOps Project with variable group with
Terraform secrets so it can be used on pipelines.

This module creates the following resources:
* Resource Group (AzureRM)
* Storage Account (AzureRM)
* Storage Container (AzureRM)
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
| terraform | >= 0.13.0 |
| azuredevops | ~> 0.1.0 |
| azurerm | ~> 2.41.0 |
| template | ~> 2.1.2 |

## Providers

| Name | Version |
|------|---------|
| azuredevops | ~> 0.1.0 |
| azurerm | ~> 2.41.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| github\_pat | n/a | `any` | n/a | yes |
| tags | n/a | `map(string)` | <pre>{<br>  "Environment": "management"<br>}</pre> | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
