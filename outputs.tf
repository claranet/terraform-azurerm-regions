output "location" {
  value       = "${local.regions[var.azure_region]}"
  description = "Converted Azure region in standard format"
}
