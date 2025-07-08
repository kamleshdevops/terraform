
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}
provider "azurerm" {
  subscription_id = "4972e01e-b3c0-45e3-becf-c21112caced1"
  features {}
}