
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
