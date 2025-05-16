output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "sql_managed_instance_name" {
  value = azurerm_mssql_managed_instance.sqlmi.name
}
