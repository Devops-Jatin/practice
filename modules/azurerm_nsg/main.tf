resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.value.security_rule
    content {
      name                       = security_rule.value.security_rule_name
      priority                   = security_rule.value.security_priority
      direction                  = security_rule.value.security_direction
      access                     = security_rule.value.security_access
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  }
}


resource "azurerm_network_interface_security_group_association" "assoc" {
  for_each = var.nsg
  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
