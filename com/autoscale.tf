# autoscale.tf

resource "azurerm_monitor_autoscale_setting" "autoscale" {
  name                = "autoscale-vms"
  location            = var.location
  resource_group_name = var.resource_group_name
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.vmss.id


  profile {
    name = "defaultProfile"

    capacity {
      minimum = var.min_instance_count
      maximum = var.max_instance_count
      default = var.default_instance_count
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        operator           = "GreaterThan"
        statistic          = "Average"
        threshold          = 80
        time_grain         = "PT1M"
        time_window        = "PT5M"
        time_aggregation   = "Average"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
        operator           = "LessThan"
        statistic          = "Average"
        threshold          = 30
        time_grain         = "PT1M"
        time_window        = "PT5M"
        time_aggregation   = "Average"
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }

  tags = {
    environment = var.environment
  }
}
