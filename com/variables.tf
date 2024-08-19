# variables.tf

variable "vmss_name" {
  description = "The name of the Virtual Machine Scale Set."
  type        = string
  default     = "vmss1"
}

variable "vm_size" {
  description = "The size of the Virtual Machines in the scale set."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "instance_count" {
  description = "The number of VM instances in the scale set."
  type        = number
  default     = 2
}

variable "admin_username" {
  description = "The admin username for the VM instances."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM instances."
  type        = string
  sensitive   = true
}

variable "vnet_subnet_id" {
  description = "The IDs of the subnets where the VM instances will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}


variable "environment" {
  description = "Environment tag for the resources (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}


variable "min_instance_count" {
  description = "The minimum number of VM instances in the scale set."
  type        = number
  default     = 1
}

variable "max_instance_count" {
  description = "The maximum number of VM instances in the scale set."
  type        = number
  default     = 8
}

variable "default_instance_count" {
  description = "The default number of VM instances in the scale set."
  type        = number
  default     = 2
}

variable "vmss_sku" {
  description = "SKU"
  type        = string
  default     = "Standard"
}

