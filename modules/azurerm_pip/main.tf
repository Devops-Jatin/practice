resource "azurerm_public_ip" "pip" {
  for_each            = var.pips
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_mathod
  tags                = each.value.tags
  sku                 = lookup(each.value, "sku", "Standard")
  sku_tier            = lookup(each.value, "sku_tier", "Regional")
}
