# output "contoso_rg_id" {
#   value       = azurerm_resource_group.contoso_rg.id
#   description = "don't show actual data on cli output"
#   sensitive   = true
# }

# output "contoso_dev_rg_id" {
#   value = azurerm_resource_group.contoso_dev_rg.id
# }

output "resource_group_ids" {
  value       = { for key, value in azurerm_resource_group.demo : key => value.id }
  description = "Resource group ids"
}