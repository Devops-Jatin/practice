data "azurerm_mssql_server" "sql" {
  for_each            = var.dbs
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}
