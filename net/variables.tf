# variables.tf

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network."
  type        = list(string)
}

variable "subnet_names" {
  description = "A list of subnet names."
  type        = list(string)
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