# main.tf


provider "azurerm" {
  features {}
}

module "net" {
  source              = "./net"
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnet_names        = var.subnet_names
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "com" {
  source              = "./com"
  location            = var.location
  resource_group_name = var.resource_group_name
  vmss_name           = var.vmss_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  vnet_subnet_id      = var.vnet_subnet_id
}



module "sec" {
  source              = "./sec"
  location            = var.location
  resource_group_name = var.resource_group_name
  nsg_name            = var.nsg_name
}