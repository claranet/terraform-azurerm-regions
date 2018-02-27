output "location" {
  value       = "${var.regions[var.azurerm_region]}"
  description = "Converted Azure region in standard format"
}
