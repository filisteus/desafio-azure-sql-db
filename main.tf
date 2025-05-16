terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  client_id       = trimspace(file("pevaristo_client-id.txt"))
  client_secret   = trimspace(file("pevaristo_client-secret.txt"))
  tenant_id       = trimspace(file("pevaristo_tenant-id.txt"))
  subscription_id = trimspace(file("pevaristo_subscription-id.txt"))
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-db-rg"
  location = "eastus"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "terraform-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "sqlmi-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "sqlmi-delegation"
    service_delegation {
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "sqlmi-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowSQL"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_route_table" "rt" {
  name                = "sqlmi-route-table"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_route_table_association" "subnet_rt_assoc" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.rt.id
}

resource "azurerm_mssql_managed_instance" "sqlmi" {
  name                         = "terraform-sqlmi"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  administrator_login          = "sqladminuser"
  administrator_login_password = "SenhaForteAqui123!"
  sku_name                    = "GP_Gen5_2"
  storage_size_in_gb          = 32
  vcores                      = 2
  license_type                = "LicenseIncluded"
  subnet_id                   = azurerm_subnet.subnet.id
  public_data_endpoint_enabled = false
  timezone_id                 = "UTC"
  minimum_tls_version         = "1.2"
  maintenance_configuration_name = "SQL_Default"
  proxy_override              = "Default"
}
