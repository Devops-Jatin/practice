resource "azurerm_mssql_database" "sqldb" {
  for_each     = var.dbs
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.sql[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  tags         = each.value.tags

  lifecycle {
    prevent_destroy = false
  }
}


