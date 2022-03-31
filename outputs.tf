output "location" {
  value       = local.regions[local.location_slug]
  description = "Azure region in standard format"
}

output "location_short" {
  value       = local.short_names[local.location_slug]
  description = "Azure region in short format for resource naming purpose"
}

output "location_cli" {
  value       = local.cli_names[local.location_slug]
  description = "Azure region in Azure CLI name format"
}

output "location_slug" {
  value       = local.location_slug
  description = "Azure region in slug format"
}

output "location_paired" {
  description = "Azure paired region with the current one (in slug format)"
  value       = local.paired[local.location_slug]
}
