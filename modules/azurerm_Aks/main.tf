resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool_name
    node_count = 1
    vm_size    = each.value.vm_size
  }
  identity {
    type = "SystemAssigned"
  }
}

