
variable "acr" {
  type = map(object({

    container_registry_name = string
    resource_group_name     = string
    location                = string
    sku                     = string
    tags                    = optional(map(string))
  }))
}
