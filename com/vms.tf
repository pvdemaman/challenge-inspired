# vmss.tf

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.vmss_sku
  instances           = var.default_instance_count
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  zones = ["1", "2"]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name                          = "network-interface1"
    primary                       = true
    enable_accelerated_networking = true

    ip_configuration {
      name                                   = "internal"
      subnet_id                              = var.vnet_subnet_id
      primary                                = true
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bap.id]
    }
  }

  upgrade_mode = "Automatic"

  tags = {
    environment = var.environment
  }

  custom_data = base64encode(<<-CLOUDINIT
    package_update: true
    package_upgrade: true
    packages:
      - docker.io

    runcmd:
      - systemctl start docker
      - docker run -d --name nginx-server-challenge -p 80:80 nginxdemos/hello:0.4
  CLOUDINIT
  )

}