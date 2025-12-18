module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "network" {
  source     = "../../modules/azurerm_networks"
  depends_on = [module.rg]
  networks   = var.networks
}

module "pip" {
  source     = "../../modules/azurerm_pip"
  depends_on = [module.network, module.rg]
  pips       = var.pips
}

module "vm" {
  source     = "../../modules/azurerm_compute"
  depends_on = [module.rg, module.network, module.pip]
  vms        = var.vms
}

module "kv" {
  source     = "../../modules/azurerm_key_vault"
  depends_on = [module.rg]
  kvs        = var.kvs
}


module "nsg" {
  source     = "../../modules/azurerm_nsg"
  depends_on = [module.rg, module.network]
  nsg        = var.nsg
}

module "storage" {
  source     = "../../modules/azurerm_storage_account"
  depends_on = [module.rg]
  stgs       = var.stgs
}

module "sql" {
  source = "../../modules/azurerm_sql_server"
  sql    = var.sql

}


module "sqldb" {
  source     = "../../modules/azurerm_sql_db"
  depends_on = [module.sql]
  dbs        = var.dbs
}

module "bastion" {
  source     = "../../modules/azurerm_bastion"
  depends_on = [module.pip, module.network]
  bastion    = var.bastion
}

module "lb" {
  source     = "../../modules/azurerm_lb"
  depends_on = [module.pip]
  lbs        = var.lbs

}

module "acr" {
  source = "../../modules/azurerm_container_registry"
  acr    = var.acr

}

module "aks" {
  source = "../../modules/azurerm_Aks"
  aks    = var.aks

}
