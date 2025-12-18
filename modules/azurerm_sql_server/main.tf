resource "azurerm_mssql_server" "mssql" {
  for_each                     = var.sql
  name                         = each.value.sql_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password
  minimum_tls_version          = "1.2"
  tags                         = each.value.tags
}



