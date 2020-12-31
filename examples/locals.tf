locals {
  tf_vars = [
    {
      name      = "ARM_CLIENT_ID"
      value     = data.azurerm_client_config.current.client_id
      is_secret = false
    },
    {
      name      = "ARM_SUBSCRIPTION_ID"
      value     = data.azurerm_client_config.current.subscription_id
      is_secret = false
    },
    {
      name      = "ARM_TENANT_ID"
      value     = data.azurerm_client_config.current.tenant_id
      is_secret = false
    },
    {
      name      = "ARM_OBJECT_ID"
      value     = data.azurerm_client_config.current.object_id
      is_secret = false
    },
    {
      name      = "AZDO_ORG_SERVICE_URL"
      value     = data.azuredevops_client_config.current.organization_url
      is_secret = false
    },
    {
      name      = "TF_IN_AUTOMATION"
      value     = "true"
      is_secret = false
    },
    {
      name      = "TF_BACKEND_RESOURCE_GROUP_NAME"
      value     = module.rg.rg_name
      is_secret = false
    },
    {
      name      = "TF_BACKEND_STORAGE_ACCOUNT_NAME"
      value     = module.st.st_name
      is_secret = false
    },
    {
      name      = "TF_BACKEND_CONTAINER_NAME"
      value     = module.st.st_containers[0].name
      is_secret = false
    }
  ]
}
