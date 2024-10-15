resource "azurerm_app_service_plan" "plan" {
  name                = "asp-${var.project}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.app_service_sku.tier
    size = var.app_service_sku.size
  }

  tags = var.tags
}

resource "azurerm_app_service" "webapp" {
  name                = "app-${var.project}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "DOCKER|mcr.microsoft.com/appsvc/staticsite:latest"
    always_on        = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://mcr.microsoft.com"
    "WEBSITE_VNET_ROUTE_ALL"              = "1"
  }

  tags = var.tags
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_app_service.webapp.id
  subnet_id      = azurerm_subnet.subnets["web"].id
}