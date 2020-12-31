# terraform-azuredevops-project

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![GitHub license](https://img.shields.io/github/license/bcochofel/terraform-azuredevops-project.svg)](https://github.com/bcochofel/terraform-azuredevops-project/blob/master/LICENSE)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/bcochofel/terraform-azuredevops-project)](https://github.com/bcochofel/terraform-azuredevops-project/tags)
[![GitHub issues](https://img.shields.io/github/issues/bcochofel/terraform-azuredevops-project.svg)](https://github.com/bcochofel/terraform-azuredevops-project/issues/)
[![GitHub forks](https://img.shields.io/github/forks/bcochofel/terraform-azuredevops-project.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/bcochofel/terraform-azuredevops-project/network/)
[![GitHub stars](https://img.shields.io/github/stars/bcochofel/terraform-azuredevops-project.svg?style=social&label=Star&maxAge=2592000)](https://github.com/bcochofel/terraform-azuredevops-project/stargazers/)

This module creates the following resources:
* Resource Group (AzureRM)
* Storage Account (AzureRM)
* Storage Container (AzureRM)
* Azure DevOps Project
* Variable Group
* GitHub Service Connection

The variable group can be used for Terraform pipelines to inject Environment Variables needed for
provider authentication (currently as all the env vars needed for both AzureRM and AzureDevOps providers besides
the secrets that must be added manually to a different variable group).

# GIT Hooks

* [`pre-commit`](https://pre-commit.com/#install)
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `tflint` hook.
* [`terraform-docs`](https://github.com/terraform-docs/terraform-docs) required for `terraform_docs` hook.

You can also use [pre-commit](https://pre-commit.com/#install). After installing
`pre-commit` just execute:

```ShellSession
pre-commit install
```

You can run specific hooks on all files:

```ShellSession
pre-commit run terraform-fmt --all-files
```

You can force all the hooks to run with the following command:

```ShellSession
pre-commit run --all-files
```

# Running tests

On the `test` folder execute `go test -v` to run all the tests.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References

* [Out-of-the-box pre-commit hooks](https://github.com/pre-commit/pre-commit-hooks)
* [Gruntwork pre-commit hooks](https://github.com/gruntwork-io/pre-commit)
* [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftnetwork)
* [Resource providers for Azure services](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers)
* [Azure Define your naming convention](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)
* [Azure Recommended abbreviations for Azure resource types](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
* [Terraform Versions Constraints](https://www.terraform.io/docs/configuration/version-constraints.html)
