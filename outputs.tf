output "location" {
  value       = local.regions[var.azure_region]
  description = "Converted Azure region in standard format"
}

output "location_short" {
  value       = local.short_names[var.azure_region]
  description = "Converted Azure region in short format for resource naming purpose"
}

