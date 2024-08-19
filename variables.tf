# variables.tf


variable "location" {
  description = "Azure region where resources will be created."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "rg-autoscale-vmss"
}


variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
  default     = "vnet-autoscale-vmss"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network."
  type        = list(string)
  default     = ["vnet-as-1"]
}

variable "subnet_names" {
  description = "List of subnet names."
  type        = list(string)
  default     = ["subnet-challenge1"]
}

variable "subnet_address_spaces" {
  description = "Address spaces for each subnet."
  type        = list(string)
  default     = ["subnet-sa-1"]
}


variable "vmss_name" {
  description = "Name of the Virtual Machine Scale Set."
  type        = string
  default     = "vmss-autoscale"
}

variable "vm_size" {
  description = "Size of the Virtual Machines in the scale set."
  type        = string
  default     = "Standard_DS1_v2"
}


variable "nsg_name" {
  description = "Name of the Network Security Group."
  type        = string
  default     = "nsg"
}

variable "vnet_subnet_id" {
  description = "The IDs of the subnets where the VM instances will be deployed."
  type        = string
  default     = "subnet-challenge1"
}

variable "admin_username" {
  type        = string
  description = "Admin"
}

variable "admin_password" {
  type        = string
  description = "Admin password"
  sensitive   = true
}
