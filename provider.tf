terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.82.0"
    }
  }
}

provider "azurerm" {

  features {}

  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""

}