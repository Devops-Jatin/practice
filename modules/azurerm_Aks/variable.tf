
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
