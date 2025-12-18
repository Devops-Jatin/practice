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
    vm_password         = map(string)
    kv_name             = string
    secret_name         = string

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    subnet_name = optional(string)
    pip_name    = optional(string)

  }))
}
