# terraform-azuredevops-project

[![pre-commit badge][pre-commit-badge]][pre-commit] [![Conventional commits badge][conventional-commits-badge]][conventional-commits] [![Keep a Changelog v1.1.0 badge][keep-a-changelog-badge]][keep-a-changelog] [![MIT License Badge][license-badge]][license]

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

# pre-commit hooks

Read the [pre-commit hooks](docs/pre-commit-hooks.md) document for more info.

# git-chglog

Read the [git-chglog](docs/git-chlog.md) document for more info.

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

[pre-commit]: https://github.com/pre-commit/pre-commit
[pre-commit-badge]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white
[conventional-commits-badge]: https://img.shields.io/badge/Conventional%20Commits-1.0.0-green.svg
[conventional-commits]: https://conventionalcommits.org
[keep-a-changelog-badge]: https://img.shields.io/badge/changelog-Keep%20a%20Changelog%20v1.1.0-%23E05735
[keep-a-changelog]: https://keepachangelog.com/en/1.0.0/
[license]: ./LICENSE
[license-badge]: https://img.shields.io/badge/license-MIT-green.svg
[changelog]: ./CHANGELOG.md
[changelog-badge]: https://img.shields.io/badge/changelog-Keep%20a%20Changelog%20v1.1.0-%23E05735
