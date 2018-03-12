output "location" {
  value       = "${var.regions[var.azure_region]}"
  description = "Converted Azure region in standard format"
}
