resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.backend_pool_name
}

resource "azurerm_lb_probe" "probe" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.probe_name
  port            = 22
}

resource "azurerm_lb_rule" "rule" {
  for_each                       = var.lbs
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = each.value.rule_name
  protocol                       = each.value.rule_protocal
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}
