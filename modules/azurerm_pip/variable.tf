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
