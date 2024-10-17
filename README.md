# Sistema Contable en Azure con Terraform

Este proyecto implementa la infraestructura para un sistema contable en Azure utilizando Terraform. La arquitectura está diseñada para ser segura, escalable y fácil de mantener.

## Estructura del proyecto

```
├── main.tf
├── network.tf
├── database.tf
├── security.tf
├── storage.tf
├── webapp.tf
├── variables.tf
└── README.md
```

El proyecto está organizado en varios archivos .tf, cada uno con un propósito específico:

- `main.tf`: Configuración del proveedor y grupo de recursos
- `network.tf`: Configuración de la red virtual y subnets
- `database.tf`: Configuración del servidor SQL y base de datos
- `security.tf`: Reglas de seguridad y NSG
- `storage.tf`: Configuración de la cuenta de almacenamiento
- `webapp.tf`: Configuración del App Service y Web App
- `variables.tf`: Definición de variables

## Componentes Principales

### 1. Proveedor y Grupo de Recursos (main.tf)

```Java
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id # ID de suscripción de Azure
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.location
  tags     = var.tags
}
```

En este archivo, configuramos el proveedor de Azure y creamos el grupo de recursos base para nuestro proyecto.

### 2. Red Virtual y Subnets (network.tf)

[[Diagrama de la arquitectura de red, mostrando la VNet y las subnets]]

Creamos una red virtual con tres subnets:
- Web: Para la capa de presentación
- App: Para la lógica de negocio
- Data: Para almacenar datos de forma segura

### 3. Base de Datos SQL (database.tf)

[[Captura de pantalla de la configuración del servidor SQL y la base de datos en el portal de Azure]]

Configuramos un servidor SQL de Azure y una base de datos, utilizando un Private Endpoint para garantizar un acceso seguro.

### 4. Seguridad (security.tf)

[[Captura de pantalla de las reglas del Network Security Group en el portal de Azure]]

Definimos reglas de seguridad en nuestro Network Security Group, incluyendo:
- Permitir tráfico HTTPS
- Permitir acceso SQL desde la subnet de aplicaciones

### 5. Almacenamiento (storage.tf)

[[Captura de pantalla de la cuenta de almacenamiento y el contenedor en el portal de Azure]]

Creamos una cuenta de almacenamiento con un contenedor privado para documentos, implementando un Private Endpoint para acceso seguro.

### 6. Aplicación Web (webapp.tf)

[[Captura de pantalla del App Service Plan y la Web App en el portal de Azure]]

Configuramos un App Service Plan y una Web App PHP, integrándola con nuestra red virtual para una comunicación segura.

### 7. Variables (variables.tf)

[[Captura de pantalla del archivo variables.tf]]

Definimos variables para hacer nuestro código más flexible y fácil de personalizar, incluyendo:
- Nombre del proyecto
- Entorno (dev, staging, prod)
- Región de Azure
- Configuraciones de red
- SKU del App Service

## Despliegue

[[Captura de pantalla del grupo de recursos en el portal de Azure, mostrando todos los recursos desplegados]]

Para desplegar esta infraestructura:

1. Clona este repositorio
2. Actualiza las variables en `variables.tf` según tus necesidades
3. Ejecuta:
   ```
   terraform init
   terraform plan
   terraform apply
   ```

## Arquitectura Final

[[Imagen del diagrama de arquitectura completo que creaste]]

Este diagrama muestra cómo todos los componentes se conectan entre sí, proporcionando una visión general de la infraestructura desplegada.

## Seguridad

Este proyecto implementa varias medidas de seguridad:
- Uso de Private Endpoints para SQL y Storage
- Network Security Group con reglas específicas
- Segregación de redes mediante subnets

## Mantenimiento y Actualizaciones

Para realizar cambios en la infraestructura:
1. Modifica los archivos .tf relevantes
2. Ejecuta `terraform plan` para ver los cambios propuestos
3. Ejecuta `terraform apply` para aplicar los cambios

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para sugerencias o mejoras.

## Licencia

Este proyecto está bajo la licencia MIT.
