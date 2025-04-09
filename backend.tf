terraform {
  backend "azurerm" {
    resource_group_name  = "ynov-web2"
    storage_account_name = "ynovnawel"
    container_name       = "tfstate"
    key                  = "ynov1.tfstate"
    tenant_id            = "38e72bba-3c22-4382-9323-ac1612931297"
    subscription_id      = "dfdaec15-00ee-472c-b134-b4d3d6a6c05c"
  }
}