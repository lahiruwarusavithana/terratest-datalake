output "resource_group_name" {
  description = "Name of the resource group"
  value       = var.resource_group_name
}
output "location" {
  description = "Location of the resource group"
  value       = var.location
}
output "storage_account_name" {
  description = "Name of the storage account name"
  value       = var.storage_account_name
}
output "datalake_name" {
  description = "Name of the datalake name"
  value       = azurerm_storage_data_lake_gen2_filesystem.datalakestorage.name
}