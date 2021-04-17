terraform {
  required_version = ">= 0.14.0"

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

  #  backend "azurerm" {}
}

provider "azuread" {}
provider "azuredevops" {}
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}
data "azuredevops_client_config" "current" {}

resource "azuread_group" "kv" {
  display_name = "Key Vault Users"
  members      = var.users_object_ids
}

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
  source  = "bcochofel/resource-group/azurerm"
  version = "1.4.1"

  name     = "rg-demolab-001"
  location = "North Europe"

  tags = var.tags
}

module "st" {
  source  = "bcochofel/storage-account/azurerm"
  version = "1.1.0"

  name                = "stdemolab001"
  resource_group_name = module.rg.name

  containers = [
    {
      name = "scdemolab001"
    }
  ]

  tags = var.tags

  depends_on = [module.rg]
}

resource "azurerm_key_vault" "main" {
  name                = "kvdemolab001"
  location            = module.rg.location
  resource_group_name = module.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"

  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  tags = var.tags

  depends_on = [module.rg]
}

resource "azurerm_key_vault_access_policy" "sp" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "create",
    "get",
  ]

  secret_permissions = [
    "set",
    "get",
    "delete",
    "purge",
    "recover"
  ]
}

resource "azurerm_key_vault_access_policy" "kvusers" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azuread_group.kv.object_id

  key_permissions = [
    "create",
    "get",
  ]

  secret_permissions = [
    "set",
    "get",
    "delete",
    "purge",
    "recover"
  ]
}
