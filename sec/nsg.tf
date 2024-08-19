# nsg.tf

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = var.environment
  }
}

resource "azurerm_network_security_rule" "allow_load_balancer_inbound" {
  name                        = "AllowLoadBalancerInbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80"]
  source_address_prefix       = "AzureLoadBalancer"
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name
}