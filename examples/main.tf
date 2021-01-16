terraform {
  required_version = ">= 0.13.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.41.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.1.2"
    }
  }

  backend "azurerm" {}
}

provider "azuredevops" {}
provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}
data "azuredevops_client_config" "current" {}

module "project" {
  source = "../"

  proj_name        = "DemoLab"
  proj_description = "DemoLab Project for demonstration purposes."
  proj_visibility  = "public"

  github_serviceendpoint_name = "GitHubConnection"
  github_pat                  = var.github_pat

  vg_name         = "terraform-configuration"
  vg_description  = "Terraform ENV Variable Group"
  vg_allow_access = true
  vg_variables    = local.tf_vars
}

module "rg" {
  source = "github.com/bcochofel/terraform-azurerm-modules//modules/resource_group?ref=0.2.0"

  name        = "rg-demolab-tf-001"
  location    = "northeurope"
  custom_tags = var.tags
}

module "st" {
  source = "github.com/bcochofel/terraform-azurerm-modules//modules/storage_account?ref=0.2.0"

  name                = "stdemolabtf001"
  resource_group_name = module.rg.rg_name
  containers = [
    {
      name        = "scdemolabtf001"
      access_type = "private"
    }
  ]

  depends_on = [module.rg]
}
