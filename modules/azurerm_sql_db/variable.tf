variable "dbs" {
  type = map(object({
    db_name             = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    resource_group_name = string
    sql_server_name     = string
    tags                = optional(map(string))
  }))

}
