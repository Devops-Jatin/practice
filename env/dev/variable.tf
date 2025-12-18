variable "rgs" {
  type = map(object({
    resource_group_name = string
    location            = string
    managed_by          = optional(string)
    tags                = optional(map(string))
  }))
}

variable "networks" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = map(object({
      snet_name        = string
      address_prefixes = list(string)
    }))

  }))
}

variable "pips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_mathod   = string
    tags                = optional(map(string))
    sku                 = optional(string, "Standard")
    sku_tier            = optional(string, "Regional")
  }))

}

variable "vms" {
  description = "Map of virtual machines to deploy"
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    vm_size             = string
    nic_name            = string
    publisher           = string
    offer               = string
    sku                 = string
    vnet_name           = string
    kv_name             = string
    secret_name         = string
    vm_password         = optional(map(string))

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    subnet_name = optional(string)
    pip_name    = optional(string)

  }))
}

variable "kvs" {
  type = map(object({
    kv_name             = string
    location            = string
    resource_group_name = string
    secret_name         = string
    secret_value        = string
  }))

}

variable "nsg" {
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    nic_name            = string
    tags                = optional(map(string))
    security_rule = map(object({

      security_rule_name = string
      security_priority  = number
      security_direction = string
      security_access    = string
      protocol           = string

    }))

  }))

}

variable "stgs" {
  type = map(object({
    storage_ac_name          = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string))
  }))

}

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

variable "bastion" {
  type = map(object({

    bastion_name        = string
    location            = string
    resource_group_name = string
    pip_name            = string
    subnet_name         = string
    vnet_name           = string
  }))
}

variable "lbs" {
  type = map(object({
    lb_name                        = string
    location                       = string
    resource_group_name            = string
    frontend_ip_configuration_name = string
    backend_pool_name              = string
    probe_name                     = string
    rule_name                      = string
    rule_protocal                  = string
    pip_name                       = string
  }))

}


variable "acr" {
  type = map(object({

    container_registry_name = string
    resource_group_name     = string
    location                = string
    sku                     = string
    tags                    = optional(map(string))
  }))
}


variable "aks" {
  type = map(object({
    aks_name               = string
    location               = string
    resource_group_name    = string
    default_node_pool_name = string
    vm_size                = string
    dns_prefix             = string
  }))

}