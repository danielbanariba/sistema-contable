variable "project" {
  description = "Project name"
  default     = "contable"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  default     = "East US 2"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    project     = "sistema-contable"
    environment = "dev"
    managed_by  = "terraform"
  }
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Address prefixes for subnets"
  type        = map(string)
  default = {
    web  = "10.0.1.0/24"
    app  = "10.0.2.0/24"
    data = "10.0.3.0/24"
  }
}

variable "app_service_sku" {
  description = "SKU for App Service Plan"
  type        = map(string)
  default = {
    tier = "Standard"
    size = "S1"
  }
}

variable "sql_admin_login" {
  description = "Admin username for SQL Server"
  default     = "sqladmin"
}

variable "sql_admin_password" {
  description = "Admin password for SQL Server"
  sensitive   = true
}

variable "subscription_id" {
    description = "ID de suscripción de Azure"
    type        = string
}