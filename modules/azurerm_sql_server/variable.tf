variable "sql" {
  type = map(object({
    sql_name            = string
    resource_group_name = string
    location            = string
    version             = string
    admin_login         = string
    admin_password      = string
    minimum_tls_version = number
    tags                = optional(map(string))
  }))

}
