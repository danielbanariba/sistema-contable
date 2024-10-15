provider "azurerm" {
  features {}
  subscription_id = var.subscription_id # ID de suscripción de Azure
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.location
  tags     = var.tags
}