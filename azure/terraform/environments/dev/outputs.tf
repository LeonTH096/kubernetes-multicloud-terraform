output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.networking.resource_group_name
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = module.networking.resource_group_id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.networking.vnet_id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = module.networking.vnet_name
}

output "aks_subnet_id" {
  description = "ID of the AKS subnet"
  value       = module.networking.aks_subnet_id
}

output "services_subnet_id" {
  description = "ID of the services subnet"
  value       = module.networking.services_subnet_id
}

output "aks_nsg_id" {
  description = "ID of the AKS network security group"
  value       = module.networking.aks_nsg_id
}

output "services_nsg_id" {
  description = "ID of the services network security group"
  value       = module.networking.services_nsg_id
}
