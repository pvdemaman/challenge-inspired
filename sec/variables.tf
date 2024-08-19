# variables.tf

variable "nsg_name" {
  description = "The name of the Network Security Group."
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
