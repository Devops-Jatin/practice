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
