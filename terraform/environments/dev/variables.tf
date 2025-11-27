variable "azure_subscription_id" {
  description = "Azure subscription ID to deploy resources"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westeurope"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "azure-aks-terraform-infra"
    Owner       = "Leonardo Colangelo"
  }
}
