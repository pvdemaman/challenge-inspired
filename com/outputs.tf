# outputs.tf

output "vmss_name" {
  description = "The name of the Virtual Machine Scale Set."
  value       = azurerm_linux_virtual_machine_scale_set.vmss.name
}

output "load_balancer_ip" {
  description = "The public IP address of the Load Balancer."
  value       = azurerm_public_ip.lb_public_ip.ip_address
}
